package com.kh.finalProject.user.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.finalProject.common.model.vo.AddressInfo;
import com.kh.finalProject.common.model.vo.Category;
import com.kh.finalProject.common.model.vo.Location;
import com.kh.finalProject.common.template.ChangeFileName;
import com.kh.finalProject.user.model.service.UserService;
import com.kh.finalProject.user.model.vo.Agree;
import com.kh.finalProject.user.model.vo.User;
import com.kh.finalProject.user.model.vo.UserInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 현재 위치의 주소 (시/도 구 동) 정보를 가지고 오는 메소드 + 해당 주소가 필터에 없다면 DB에 삽입하는 메소드
	@ResponseBody
	@RequestMapping(value="searchLocation", produces="application/json;charset=UTF-8")
	public AddressInfo getLocationName(String latitude, String longitude) throws Exception{
		
		String url = "https://dapi.kakao.com/v2/local/geo/coord2address.JSON";
		url += "?x=" + longitude;
		url += "&y=" + latitude;
		
		URL requestURL = new URL(url);
		HttpURLConnection urlCon = (HttpURLConnection)requestURL.openConnection();
		urlCon.setRequestProperty("Authorization", "KakaoAK ee0fa04eff270f586463a6c95c8047d6");
		urlCon.setRequestProperty("Content-Type", "application/json");
		urlCon.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
		
		String responseData = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		
		JsonObject jobj = JsonParser.parseString(responseData).getAsJsonObject();
		JsonArray documents = jobj.getAsJsonArray("documents");
		JsonArray address1 = documents.getAsJsonArray();
		JsonObject address2 = address1.get(0).getAsJsonObject();
		JsonObject addressName = address2.get("address").getAsJsonObject();
		
		new AddressInfo();
		AddressInfo addressInfo = AddressInfo.builder().addressName(addressName.get("address_name").getAsString())
													   .regionDepthName1(addressName.get("region_1depth_name").getAsString())
													   .regionDepthName2(addressName.get("region_2depth_name").getAsString())
													   .regionDepthName3(addressName.get("region_3depth_name").getAsString()).build();
		
		new Location();
		Location locationInfo = Location.builder()
											  .locationName(addressName.get("region_1depth_name").getAsString())
											  .locationDetail1(addressName.get("region_2depth_name").getAsString())
											  .locationDetail2(addressName.get("region_3depth_name").getAsString())
											  .build();
		
		Location locDulCheck = userService.checkLocationDul(locationInfo);
		
		if(locDulCheck == null) {
			int result = userService.insertLocationFilter(locationInfo);
			
			if(result > 0) {
				log.debug("새로운 주소 삽입");
			}
		}
		
		// 현재 위치 기반 시/도 구 동 출력
		return addressInfo;
	}
	
	// 로그인 페이지 이동
	@RequestMapping("login")
	public String loginForm() {
		
		return "user/loginFormView";
	}
	
	// 로그인 기능
	@RequestMapping("loginUser")
	public ModelAndView loginUser(User user, String saveId, HttpServletResponse response,
											HttpSession session, ModelAndView mv) {
		
		// 쿠키 설정 과정 (아이디 저장)
		Cookie cookie = null;
		
		if(saveId != null) {
			cookie = new Cookie("userId", user.getUserId());
			cookie.setMaxAge(60 * 60 * 24); // 하루동안 저장 가능
			response.addCookie(cookie);	
		}
		else {
			cookie = new Cookie("userId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		User loginUser = userService.loginUser(user);
		
		if(loginUser != null) {
			if(bcryptPasswordEncoder.matches(user.getUserPwd(), loginUser.getUserPwd())) {
				session.setAttribute("loginUser", loginUser);
				// session.setAttribute("alertMsg", "환영합니다. " + loginUser.getNickname() + "님");
				mv.setViewName("redirect:/");
			}
			else {
				session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
				mv.setViewName("user/loginFormView");
			}
		}
		else {
			session.setAttribute("alertMsg", "존재하지 않는 회원입니다.");
			mv.setViewName("user/loginFormView");
		}
		
		return mv;
	}
	
	// 로그아웃 메소드
	@RequestMapping("logout")
	public ModelAndView logoutUser(HttpSession session, ModelAndView mv) {
		
		session.removeAttribute("loginUser");
		// session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		mv.setViewName("redirect:/");
		
		return mv;
		
	}
	
	// 회원가입 이동 메소드
	@RequestMapping("sginin")
	public String sginInForm() {
		
		return "user/userEnrollAgreeForm";
		
	}
	
	// 회원가입 정보입력창으로 이동 메소드
	@GetMapping("userEnrollForm")
	public ModelAndView phoneCheckForm(Agree agree, ModelAndView mv) {
		
		mv.addObject("agree", agree);
		mv.setViewName("user/userEnrollInputForm");
		
		return mv;
	}
	
	// 아이디 중복확인 메소드
	@ResponseBody
	@RequestMapping(value="checkId", produces="text/html;charset=UTF-8")
	public String checkId(String userId) {
		
		User user = userService.checkId(userId);
		
		String msg = "";
		
		if(user == null) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 닉네임 중복확인 메소드
	@ResponseBody
	@RequestMapping(value="nicknameCheck", produces="text/html;charset=UTF-8")
	public String nicknameCheck(String nickname) {
		
		User user = userService.nicknameCheck(nickname);
		
		String msg = "";
		
		if(user == null) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 회원가입 메소드
	@RequestMapping("insertUser")
	public ModelAndView insertUser(User user, Agree agree, ModelAndView mv, HttpSession session) {
		
		String userPwd = bcryptPasswordEncoder.encode(user.getUserPwd());
		user.setUserPwd(userPwd);
		
		int result1 = userService.insertUser(user);
		
		if(result1 > 0) {
			
			int result2 = userService.insertAgree(agree);
			
			if(result2 > 0) {
				session.setAttribute("alertMsg", "회원가입 감사합니다.");
			}
			else {
				session.setAttribute("alertMsg", "회원가입 오류 발생 (관리자에게 문의해주세요.)");
			}
			
		}
		else {
			session.setAttribute("alertMsg", "회원가입 오류 발생 (관리자에게 문의해주세요.)");
		}
		
		mv.setViewName("redirect:/");
		return mv;
	}
	
	// 카테고리를 가져오는 메소드
	@ResponseBody
	@RequestMapping(value="getCate", produces="application/json;charset=UTF-8")
	public ArrayList<Category> getCategory() {
		
		ArrayList<Category> cList = userService.getCategory();
		
		return cList;
		
	}
	
	// 마이페이지 이동 메소드
	@RequestMapping("mypage")
	public ModelAndView mypage(HttpSession session, ModelAndView mv) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		UserInfo userInfo = userService.selectInfo(loginUser.getUserId());
		mv.addObject("userInfo", userInfo);
		mv.addObject("loginUser", loginUser);
		mv.setViewName("user/mypage");
		
		return mv;
	}
	
	// KH PAY 충전 페이지 이동 메소드
	@RequestMapping("toPurchaseKH")
	public String toPurchaseKH() {
		
		return "common/khpaypurchasePage";
	}
	
	// 카카오 결제 서비스 api - 준비단계
	@ResponseBody
	@RequestMapping(value="purchaseKakao", produces="application/json;charset=UTF-8")
	public HashMap<String, String> purchaseKakao(int payMount, HttpServletRequest request) throws Exception {
	    
	    String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	    int randomNum = (int) (Math.random() * 90000 + 10000);
	    User user = (User)request.getSession().getAttribute("loginUser");
	    String partnerOderId = date + randomNum;

	    // 카카오페이 결제 준비 API URL
	    String url = "https://open-api.kakaopay.com/online/v1/payment/ready";
	    
	    // JSON 데이터 준비
	    String jsonData = String.format("{"
	        + "\"cid\": \"TC0ONETIME\","
	        + "\"partner_order_id\": \"%s\","
	        + "\"partner_user_id\": \"%s\","
	        + "\"item_name\": \"kakao\","
	        + "\"quantity\": \"1\","
	        + "\"total_amount\": \"%d\","
	        + "\"vat_amount\": \"%d\","
	        + "\"tax_free_amount\": \"0\","
	        + "\"approval_url\": \"http://localhost:8888/final/user/toPurchaseKH\","
	        + "\"cancel_url\": \"http://localhost:8888/final/user/toPurchaseKH\","
	        + "\"fail_url\": \"http://localhost:8888/final/user/toPurchaseKH\""
	        + "}", 
	        partnerOderId,  // partner_order_id
	        user.getUserId(),  // partner_user_id
	        payMount,           // total_amount
	        (int)(payMount * 0.01)  // vat_amount
	    );

	    // HTTP 요청 보내기
	    URL requestURL = new URL(url);
	    HttpURLConnection urlCon = (HttpURLConnection)requestURL.openConnection();
	    
	    // Authorization 헤더에 실제 비밀 키 설정
	    urlCon.setRequestProperty("Authorization", "SECRET_KEY DEV8697654ACC7FC30C52DA589D17B61AA5A344C");
	    urlCon.setRequestProperty("Content-Type", "application/json");
	    urlCon.setRequestMethod("POST");
	    urlCon.setDoOutput(true); // 요청 본문을 쓸 수 있게 설정
	    
	    // JSON 데이터 출력 스트림에 쓰기
	    try (OutputStreamWriter writer = new OutputStreamWriter(urlCon.getOutputStream())) {
	        writer.write(jsonData);
	        writer.flush();
	    }
	    
	    // 응답 읽기
	    BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
	    
	    String responseData = "";
	    String line;
	    
	    while((line = br.readLine()) != null) {
	        responseData += line;
	    }
	    
	    JsonObject jobj = JsonParser.parseString(responseData).getAsJsonObject();
	    String redirectPCUrl = jobj.get("next_redirect_pc_url").getAsString();
	    String tid = jobj.get("tid").getAsString();
	    
	    HashMap<String, String> map = new HashMap<>();
	    map.put("redirectPCUrl", redirectPCUrl);
	    map.put("tid", tid);
	    map.put("partnerOderId", partnerOderId);
	    
	    return map;
	}
	
	// 카카오 결제 서비스 api - 결제승인단계
	@ResponseBody
	@RequestMapping(value="approvalProcess", produces="application/json;charset=UTF-8")
	public String approvalProcess(String pgToken, String tid, 
								String partnerOderId, HttpServletRequest request) throws Exception {
	    
	    User user = (User)request.getSession().getAttribute("loginUser");

	    // 카카오페이 결제 준비 API URL
	    String url = "https://open-api.kakaopay.com/online/v1/payment/approve";
	    
	    // JSON 데이터 준비
	    String jsonData = String.format("{"
	        + "\"cid\": \"TC0ONETIME\","
	        + "\"tid\": \"%s\","
	        + "\"partner_order_id\": \"%s\","
	        + "\"partner_user_id\": \"%s\","
	        + "\"pg_token\": \"%s\","
	        + "}", 
	        tid, // tid
	        partnerOderId,  // partner_order_id
	        user.getUserId(),  // partner_user_id
	        pgToken // pg_token
	    );

	    // HTTP 요청 보내기
	    URL requestURL = new URL(url);
	    HttpURLConnection urlCon = (HttpURLConnection)requestURL.openConnection();
	    
	    // Authorization 헤더에 실제 비밀 키 설정
	    urlCon.setRequestProperty("Authorization", "SECRET_KEY DEV8697654ACC7FC30C52DA589D17B61AA5A344C");
	    urlCon.setRequestProperty("Content-Type", "application/json");
	    urlCon.setRequestMethod("POST");
	    urlCon.setDoOutput(true); // 요청 본문을 쓸 수 있게 설정
	    
	    // JSON 데이터 출력 스트림에 쓰기
	    try (OutputStreamWriter writer = new OutputStreamWriter(urlCon.getOutputStream())) {
	        writer.write(jsonData);
	        writer.flush();
	    }
	    
	    // 응답 읽기
	    BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
	    
	    String responseData = "";
	    String line;
	    
	    while((line = br.readLine()) != null) {
	        responseData += line;
	    }
	    
	    return responseData;
	}
	
	// 마이페이지 - 회원 정보 수정 페이지 이동 메소드
	@RequestMapping("userInfoUpdateForm")
	public ModelAndView userInfoUpdateForm(HttpServletRequest request, ModelAndView mv) {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		mv.addObject("loginUser", loginUser);
		mv.setViewName("user/userInfoUpdateForm");
		
		return mv;
		
	}
	
	// 마이페이지 - 회원 주소 수정 메소드
	@ResponseBody
	@RequestMapping(value="updateAddr", produces="html/text;charset=UTF-8")
	public String updateAddress(String address, HttpServletRequest request) {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		loginUser.setAddress(address);
		int result = userService.updateAddress(loginUser);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 핸드폰, 이메일 정보 수정 메소드
	@ResponseBody
	@RequestMapping(value="updateOtherInfo", produces="html/text;charset=UTF-8")
	public String updateOtherInfo(HttpServletRequest request, String phone, String email) {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		loginUser.setEmail(email);
		loginUser.setPhone(phone);
		int result = userService.updateOtherInfo(loginUser);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 비밀글 비밀번호 확인
	@ResponseBody
	@RequestMapping(value="matchPwd", produces="html/text;charset=UTF-8")
	public String matchPwd(User user, String password) {
		
		User checkUser = userService.loginUser(user);
		boolean matchPwd = bcryptPasswordEncoder.matches(password, checkUser.getUserPwd());
		
		String msg = "";
		
		if(matchPwd) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 마이페이지 회원 프로필 사진 변경 메소드
	@RequestMapping("changeProfileImg")
	public ModelAndView changeProfileImg(MultipartFile upfile, HttpServletRequest request,
												ModelAndView mv) throws Exception {

		HttpSession session = request.getSession();
		
		User loginUser = (User)session.getAttribute("loginUser");
		String beforeProfileImg = loginUser.getUserImg();
		
		String savePath = session.getServletContext().getRealPath("/resources/userProfileImg/");
		File file = new File(savePath + beforeProfileImg.substring(beforeProfileImg.lastIndexOf("/")));

		if(!upfile.isEmpty()) {
			if(!upfile.getOriginalFilename().equals("Default-Profile-Pic.png")) {
				file.delete();
			}
			String changeName = new ChangeFileName().changeProfileFileName(upfile, session);
			loginUser.setUserImg("/resources/userProfileImg/" + changeName);
		}
		else {
			loginUser.setUserImg("/resources/Default-Profile-Pic.png");
		}
		
		int result = userService.changeProfileImg(loginUser);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "프로필 사진이 변경되었습니다.");
		}
		else {
			session.setAttribute("alertMsg", "오류 발생. 관리자에게 문의하세요.");
		}
		mv.setViewName("redirect:/");
		
		return mv;
		
	}
	
	// 마이페이지 소개메시지 수정 메소드
	@ResponseBody
	@RequestMapping(value="changeIntro", produces="html/text;charset=UTF-8")
	public String changeIntro(User user, HttpServletRequest request) {
		
		int result = userService.changeIntro(user);
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		loginUser.setIntroContent(user.getIntroContent());
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 닉네임 변경하는 메소드
	@RequestMapping("changeNickname")
	public ModelAndView changeNickname(String nickname, ModelAndView mv, HttpServletRequest request) {

		User loginUser = (User)request.getSession().getAttribute("loginUser");
		new User();
		User user = User.builder().nickname(nickname).userId(loginUser.getUserId()).build();

		int result = userService.updateNickname(user);
		loginUser.setNickname(nickname);
		
		if(result == 0) {
			request.getSession().setAttribute("alertMsg", "요청 오류 관리자에게 문의하세요.");
		}
		mv.setViewName("user/mypage");
		
		return mv;
		
	}
	
	// 회원 탈퇴 페이지 이동 메소드
	@RequestMapping("userDeleteForm")
	public ModelAndView userDeleteForm(HttpServletRequest request, ModelAndView mv) {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		mv.addObject("loginUser", loginUser);
		mv.setViewName("/user/userDeleteForm");
		
		return mv;
	}
	
	// 회원 탈퇴 메소드
	@ResponseBody
	@RequestMapping(value="checkPwd", produces="html/text;charset=UTF-8")
	public String checkPwd(User user, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		boolean pwdMatch = bcryptPasswordEncoder.matches(user.getUserPwd(), loginUser.getUserPwd());
		
		String msg = "";
		
		if(pwdMatch) {
			int result = userService.deleteUserInfo(loginUser);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "회원탈퇴가 정상적으로 처리되었습니다.");
				session.removeAttribute("loginUser");
				msg = "NNNNY";
			}
			else {
				session.setAttribute("alertMsg", "처리 중 오류가 발생했습니다. 관리자에게 문의해주세요.");
				msg = "NNNNN";
			}
		}
		else {
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
}
