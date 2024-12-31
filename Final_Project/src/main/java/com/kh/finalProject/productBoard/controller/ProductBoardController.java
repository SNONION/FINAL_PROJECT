package com.kh.finalProject.productBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.common.model.vo.Category;
import com.kh.finalProject.common.model.vo.Kind;
import com.kh.finalProject.common.model.vo.Location;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.ChangeFileName;
import com.kh.finalProject.common.template.PageNation;
import com.kh.finalProject.productBoard.model.service.ProductBoardService;
import com.kh.finalProject.productBoard.model.vo.Media;
import com.kh.finalProject.productBoard.model.vo.Notice;
import com.kh.finalProject.productBoard.model.vo.ProductBoard;
import com.kh.finalProject.productBoard.model.vo.ProductInfo;
import com.kh.finalProject.productBoard.model.vo.Request;
import com.kh.finalProject.productBoard.model.vo.Response;
import com.kh.finalProject.user.model.service.UserService;
import com.kh.finalProject.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class ProductBoardController {
	
	@Autowired
	private ProductBoardService productBoardService;
	
	@Autowired
	private UserService userService;
	
	// 마이페이지 내 상품 조회 메소드
	@ResponseBody
	@RequestMapping(value="myProduct", produces="application/json;charset=UTF-8")
	public ArrayList<ProductBoard> selectProductAll(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
																					User user, String type) {
		
		int listCount = productBoardService.listCount(user);
		int pageLimit = 10;
		int boardLimit = 20;
		
		PageInfo pi = PageNation.pageNation(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<ProductBoard> pList = null;
		
		switch(type) {
			case "판매 중" :
				pList = productBoardService.selectProductSell(user, pi);
				break;
			case "예약 중" :
				pList = productBoardService.selectProductReserv(user, pi);
				break;
			case "판매완료" :
				pList = productBoardService.selectProductDone(user, pi);
				break;
			default : 
				pList = productBoardService.selectProductAll(user, pi);
				break;
		}
		
		return pList;
	}
	
	// 공지사항 이동 메소드
	@RequestMapping("toNotice")
	public ModelAndView toNotice(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv,
															HttpServletRequest request) {
		
		int listCount = productBoardService.noticeCount();
		int pageLimit = 10;
		int listLimit = 10;
		
		PageInfo pi = PageNation.pageNation(listCount, currentPage, pageLimit, listLimit);
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		ArrayList<Notice> nList = productBoardService.selectNotice(pi);
		mv.addObject("loginUser", loginUser);
		mv.addObject("nList", nList);
		mv.addObject("pi", pi);
		mv.setViewName("notice/noticeForm");
		
		return mv;
	}
	
	// 공지사항 디테일뷰 이동 메소드
	@RequestMapping("toNoticeDetail")
	public ModelAndView toNoticeDetail(Notice notice, ModelAndView mv) {
		
		Notice n = productBoardService.selectNoticeOne(notice);
		productBoardService.updateCount(notice);
		mv.addObject("n", n);
		mv.setViewName("notice/noticeDetailForm");
		
		return mv;
	}
	
	// 공지사항 수정페이지 이동 메소드
	@RequestMapping("toUpdateNoticeForm")
	public ModelAndView toUpdateNoticeForm(Notice notice, ModelAndView mv) {
		
		Notice n = productBoardService.selectNoticeOne(notice);
		mv.addObject("n", n);
		mv.setViewName("notice/noticeUpdateForm");
		
		return mv;
	}
	
	// 공지사항 수정 메소드
	@ResponseBody
	@RequestMapping(value="updateNotice", produces="html/text;charset=UTF-8")
	public String updateNotice(Notice notice) {

		int result = productBoardService.updateNotice(notice);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
	}
	
	// 공지사항 삭제 메소드
	@ResponseBody
	@RequestMapping(value="deleteNotice", produces="html/text;charset=UTF-8")
	public String deleteNotice(Notice notice) {
		
		int result = productBoardService.deleteNotice(notice);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 공지사항 작성페이지 이동 메소드
	@RequestMapping("toNoticeEnroll")
	public ModelAndView toNoticeEnroll(ModelAndView mv, HttpServletRequest request) {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		mv.addObject("loginUser", loginUser);
		mv.setViewName("notice/noticeEnrollForm");
		
		return mv;
		
	}
	
	// 공지사항 작성 메소드
	@ResponseBody
	@RequestMapping(value="insertNotice", produces="html/text;charset=UTF-8")
	public String insertNotice(Notice notice) {
		
		int result = productBoardService.insertNotice(notice);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 찜하기 페이지 이동 메소드
	@RequestMapping("myPickPage")
	public ModelAndView myPickPage(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
														ModelAndView mv, HttpServletRequest request) {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		int listCount = productBoardService.myPickCount(loginUser.getUserId());
		int pageLimit = 10;
		int listLimit = 20;
		
		PageInfo pi = PageNation.pageNation(listCount, currentPage, pageLimit, listLimit);
		
		ArrayList<ProductBoard> pbList = productBoardService.selectPBList(loginUser.getUserId(), pi);
		mv.addObject("pbList", pbList);
		mv.setViewName("user/myPickPage");
		
		return mv;
		
	}
	
	// 구매한 내역 페이지 이동 메소드
	@RequestMapping("buyProductList")
	public ModelAndView buyProductList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
			ModelAndView mv, HttpServletRequest request) {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		int listCount = productBoardService.buyProductCount(loginUser.getUserId());
		int pageLimit = 10;
		int listLimit = 20;
		
		PageInfo pi = PageNation.pageNation(listCount, currentPage, pageLimit, listLimit);
		
		ArrayList<ProductBoard> bpbList = productBoardService.buyProductList(loginUser.getUserId(), pi);
		mv.addObject("bpbList", bpbList);
		mv.setViewName("user/mypageBuyProductList");
		
		return mv;
		
	}
	
	// 문의 게시판 이동 메소드
	@RequestMapping("toRequest")
	public ModelAndView toRequest(@RequestParam(value="currentPage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = productBoardService.requestCount();
		int pageLimit = 10;
		int listLimit = 10;
		
		PageInfo pi = PageNation.pageNation(listCount, currentPage, pageLimit, listLimit);
		
		ArrayList<Request> rList = productBoardService.requestList(pi);
		mv.addObject("rList", rList);
		mv.addObject("pi", pi);
		mv.setViewName("request/requestForm");
		
		return mv;
	}
	
	// 문의 상세보기 이동 메소드
	@RequestMapping("toRequestDetail")
	public ModelAndView toRequestDetail(Request request, ModelAndView mv) {
		
		Request r = productBoardService.selectRequest(request.getRequestNo());
		mv.addObject("r", r);
		mv.setViewName("request/requestDetailForm");
		
		return mv;
		
	}
	
	// 문의 수정페이지 이동 메소드
	@RequestMapping("toUpdateRequestForm")
	public ModelAndView toUpdateRequestForm(Request request, ModelAndView mv) {
		
		Request r = productBoardService.selectRequest(request.getRequestNo());
		mv.addObject("r", r);
		mv.setViewName("request/requestUpdateForm");
		
		return mv;
		
	}
	
	// 문의 수정 메소드
	@ResponseBody
	@RequestMapping(value="updateRequest", produces="html/text;charset=UTF-8")
	public String updateRequest(Request r, HttpServletRequest request) {
		
		User user = (User)request.getSession().getAttribute("loginUser");
		r.setRequestWriter(user.getUserId());
		int result = productBoardService.updateRequest(r);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 문의 삭제 메소드
	@ResponseBody
	@RequestMapping(value="deleteRequest", produces="html/text;charset=UTF-8")
	public String deleteRequest(int requestNo) {
		
		int result = productBoardService.deleteRequest(requestNo);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 문의 작성페이지 이동 메소드
	@RequestMapping("toRequestEnroll")
	public ModelAndView toRequestEnroll(HttpServletRequest request, ModelAndView mv) {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		mv.addObject("loginUser", loginUser);
		mv.setViewName("request/requestEnrollForm");
		
		return mv;
		
	}
	
	// 문의 작성 메소드
	@ResponseBody
	@RequestMapping(value="insertRequest", produces="html/text;charset=UTF-8")
	public String insertRequest(Request request) {
		
		int result = productBoardService.insertRequest(request);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 문의 응답 작성 메소드
	@ResponseBody
	@RequestMapping(value="insertResponse", produces="html/text;charset=UTF-8")
	public String insertResponse(Response response) {
		
		int result = productBoardService.insertResponse(response);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 문의 응답 조회 메소드
	@ResponseBody
	@RequestMapping(value="selectResponse", produces="application/json;charset=UTF-8")
	public Response selectResponse(Response response) {
		
		Response res = productBoardService.selectResponse(response);
		
		return res;
		
	}
	
	
	// 문의 응답 삭제 메소드
	@ResponseBody
	@RequestMapping(value="deleteResponse", produces="html/text;charset=UTF-8")
	public String deleteResponse(Response response) {
		
		int result = productBoardService.deleteResponse(response);
		
		String msg = "";
		
		if(result > 0) {
			msg = "NNNNY";
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 상품 게시판 작성 페이지로 이동하는 메소드
	@RequestMapping("productBoardEnrollForm")
	public ModelAndView productBoardEnrollForm(HttpServletRequest request, ModelAndView mv) {
		
		ArrayList<Location> lList = productBoardService.selectLocationList();
		ArrayList<Category> cList = userService.getCategory();
		ArrayList<Kind> kList = productBoardService.selectKindList();
		
		mv.addObject("lList", lList);
		mv.addObject("cList", cList);
		mv.addObject("kList", kList);
		mv.setViewName("productBoard/pBoardEnrollForm");
		
		return mv;
		
	}
	
	// 상세카테고리 조회하는 메소드
	@ResponseBody
	@RequestMapping(value="cateDetail", produces="application/json;charset=UTF-8")
	public ArrayList<Category> cateDetail(Category category) {
		
		ArrayList<Category> cDList = productBoardService.selectDetailCateList(category);
		
		return cDList;
				
	}
	
	// 상품 게시판 작성 메소드
	@RequestMapping("insertProductBoard")
	public ModelAndView insertProductBoard(ProductBoard pBoard, ProductInfo pInfo, HttpServletRequest request,
											ModelAndView mv,
											@RequestParam("upFile") MultipartFile[] upFile, 
								            @RequestParam("mainFile") MultipartFile mainFile) throws Exception {

		HttpSession session = request.getSession();
		
		// 게시판 작성전 사용할 게시판의 번호를 먼저 만들어 조회해온다.
		int boardNo = productBoardService.makeBoardNo();
		
		// 만들어온 게시판 번호를 입력받은 상품게시판과 상품 정보 테이블 데이터에 넣어준다
		pBoard.setBoardNo(boardNo);
		pInfo.setBoardNo(boardNo);
		
		// 이미지 파일을 올린 경우에만 실행 (없는 경우도 있음)
		if(!mainFile.getOriginalFilename().equals("")) {
			String changeMainName = new ChangeFileName().changeProductFileName(mainFile, session);
			pBoard.setTitleImg("/resources/productImgFiles/" + changeMainName);
		}
		
		// 다른 이미지 파일을 받아줄 리스트 및 객체 생성
		Media media = new Media();
		ArrayList<Media> mList = new ArrayList<>();
		
		// 상품 게시판에 올라갈 다른 이미지 파일들이 있는 경우에만 실행
		if(!upFile[0].getOriginalFilename().equals("")) {
			for(MultipartFile mediaFile : upFile) {
				String changeOtherName = new ChangeFileName().changeProductFileName(mediaFile, session);
				media = Media.builder().changeName(changeOtherName).mediaPath("/resources/productImgFiles/")
							   .originName(mediaFile.getOriginalFilename()).refBno(boardNo).build();
				
				mList.add(media);
			}
		}
		
		// 19태그가 ON / NULL에 따라 N / Y로 변경
		if(pBoard.getTag19Product() == null) {
			pBoard.setTag19Product("N");
		}
		else {
			pBoard.setTag19Product("Y");
		}
		
		/* ----------------- 윗 부분은 삽입을 위한 재료손질 부분 ------------------ */
		
		// 제품 게시판을 먼저 작성한 후 제품정보를 작성해준다 (상품게시판을 상품정보가 참조)
		int result1 = productBoardService.insertProductBoard(pBoard);
		
		int result2 = 0;
		int result3 = 1;
		
		// 상품 게시판에 삽입이 성공했을 경우에 상품정보와 미디어 파일 삽입
		if(result1 > 0) {
			result2 = productBoardService.insertProductInfo(pInfo);
			
			// 다른 이미지 파일들이 있을 경우에만 진행
			if(!upFile[0].getOriginalFilename().equals("")) {
				result3 = productBoardService.insertMediaFile(mList);
			}
		}
		
		int result = result1 * result2 * result3;
		
		if(result > 0) {
			session.setAttribute("alertMsg", "글작성을 완료했습니다.");
			
			// 글 작성 성공시 리스트 페이지로 이동
			mv.setViewName("redirect:/");
		}
		else {
			session.setAttribute("alertMsg", "글 작성 도중 오류가 발생했습니다.");
			
			// 글작성 실패시 다시 작성페이지로 이동
			mv.setViewName("/productBoard/pBoardEnrollForm");
		}
		
		return mv;
		
	}
	
	// 최근 작성한 상품 게시글 5개를 조회하는 메소드
	@ResponseBody
	@RequestMapping(value="recentBoardfive", produces="application/json;charset=UTF-8")
	public ArrayList<ProductBoard> recentBoardfive() {
		
		ArrayList<ProductBoard> pbList = productBoardService.selectRecentBoard();
		
		return pbList;
		
	}
	
	// 가장 인기있는 (조회수가 높은) 상품을 조회하는 메소드
	@ResponseBody
	@RequestMapping(value="topFiveProduct", produces="application/json;charset=UTF-8")
	public ArrayList<ProductBoard> topFiveProduct(@RequestParam(value="currentPage", defaultValue="1")int currentPage,
													HttpServletRequest request) {
		
		int listCount = productBoardService.listAllCount();
		int pageLimit = 5;
		int	boardLimit = 3;
		
		PageInfo pi = PageNation.pageNation(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<ProductBoard> tfList = productBoardService.topFiveProduct(pi);
		request.getSession().setAttribute("page", pi);
		
		return tfList;
	
	}
	
	// 메인페이지에 카테고리 조회해오는 메소드
	@ResponseBody
	@RequestMapping(value="getCate", produces="application/json;charset=UTF-8")
	public ArrayList<Category> getCate(@RequestParam(value="currentPage", defaultValue="1")int currentPage,
													HttpServletRequest request) {
		
		int listCount = productBoardService.getCateCount();
		int pageLimit = 5;
		int cateLimit = 5;
		
		PageInfo pi = PageNation.pageNation(listCount, currentPage, pageLimit, cateLimit);
		
		ArrayList<Category> cList = productBoardService.getCate(pi);
		request.getSession().setAttribute("catePage", pi);
		
		return cList;
		
	}
	
	// 제품 게시판 이동 메소드 -- 추후에 변경
	@RequestMapping("productBoardForm")
	public ModelAndView productBoardForm(Category category, ModelAndView mv) {
		
		mv.addObject("category", category);
		Category categoryNo = productBoardService.getCategoryNo(category);
		ProductBoard board = ProductBoard.builder().categoryNo(categoryNo.getCategoryNo()).build();
		ArrayList<ProductBoard> searchBoard = productBoardService.searchFilterBoard(board);
		
		mv.addObject("searchBoard", searchBoard);
		mv.setViewName("productBoard/productBoardList");
		
		return mv;
				
	}
	
	// 위치를 조회하는 필터
	@ResponseBody
	@RequestMapping(value="locationFilter", produces="application/json;charset=UTF-8")
	public ArrayList<Location> locationFilter() {
		
		ArrayList<Location> locOptList = productBoardService.locationFilter();
		
		return locOptList;
		
	}
	
	// 카테고리를 조회해오는 필터
	@ResponseBody
	@RequestMapping(value="categoryFilter", produces="application/json;charset=UTF-8")
	public ArrayList<Category> categoryFilter() {

		int listCount = productBoardService.getCateCount();
		int pageLimit = 15;
		int cateLimit = 20;
		
		PageInfo pi = PageNation.pageNation(listCount, 1, pageLimit, cateLimit);
		
		ArrayList<Category> cateOptList = productBoardService.getCate(pi);

		return cateOptList;
		
	}
	
	// 판매유형을 조회해오는 필터
	@ResponseBody
	@RequestMapping(value="sellTypeFilter", produces="application/json;charset=UTF-8")
	public ArrayList<Kind> sellTypeFilter() {
		
		ArrayList<Kind> kindOptList = productBoardService.selectKindList();
		
		return kindOptList;
		
	}
	
	// 위치 상세 조회하는 필터
	@ResponseBody
	@RequestMapping(value="locationDeep1Filter", produces="application/json;charset=UTF-8")
	public ArrayList<Location> locationDeep1Filter(Location location) {
		
		ArrayList<Location> locD1OptList = productBoardService.locationDeep1Filter(location);
		
		return locD1OptList;
		
	}
	
	// 카테고리 상세 조회해오는 필터
	@ResponseBody
	@RequestMapping(value="categoryDetailFilter", produces="application/json;charset=UTF-8")
	public ArrayList<Category> categoryDetailFilter(Category category) {
		
		ArrayList<Category> cateDetailOptList = productBoardService.categoryDetailFilter(category);
		
		return cateDetailOptList;
		
	}
	
	// 위치 상세 조회하는 필터
	@ResponseBody
	@RequestMapping(value="locationDeep2Filter", produces="application/json;charset=UTF-8")
	public ArrayList<Location> locationDeep2Filter(Location location) {
		
		ArrayList<Location> locD2OptList = productBoardService.locationDeep2Filter(location);
		
		return locD2OptList;
		
	}
	
	// 상품 게시판의 필터로 검색
	@RequestMapping("searchBoardFilter")
	public ModelAndView searchBoardFilter(Category category, Location location, 
										ProductBoard board, String minPrice, String maxPrice,
										ModelAndView mv) {
		Category categoryNo = null;
		if(category.getCategoryName() != null) {
			mv.addObject("filterCategory", category);
			categoryNo = productBoardService.getCategoryNo(category);
			board.setCategoryNo(categoryNo.getCategoryNo());
		}
		
		if(location.getLocationName() != null) {
			mv.addObject("location", location);
			board.setSellLocation(location.getLocationName() + " " + location.getLocationDetail1());
		}
		
		ArrayList<ProductBoard> searchBoard = productBoardService.searchFilterBoard(board);

		ArrayList<ProductBoard> priceSearchBoard = new ArrayList<>();
		if(minPrice != null && maxPrice != null) {
			for(ProductBoard pb : searchBoard) {
				if(pb.getPrice() >= Integer.parseInt(minPrice) && pb.getPrice() <= Integer.parseInt(maxPrice)) {
					priceSearchBoard.add(pb);
				}
			}
			mv.addObject("priceSearchBoard", priceSearchBoard);
			mv.addObject("minPrice", minPrice);
			mv.addObject("maxPrice", maxPrice);
		}
		else {
			mv.addObject("searchBoard", searchBoard);
		}
		
		mv.addObject("board", board);
		
		mv.setViewName("productBoard/productBoardList");
		
		return mv;
		
	}
	
	// 상품 게시판 상세보기 페이지 이동 메소드
	@RequestMapping("boardDetailForm")
	public ModelAndView boardDetailForm(ProductBoard board, ModelAndView mv) {
		
		int result = productBoardService.updateBoardCount(board);
		
		if(result > 0) {
			ProductBoard detailBoard = productBoardService.boardDetailForm(board);
			ProductInfo productInfo = productBoardService.selectProductInfo(board);
			ArrayList<Media> media = productBoardService.selectMediaFile(board);
			Category category = productBoardService.boardCategory(detailBoard.getCategoryNo());
			
			User user = User.builder().userId(detailBoard.getBoardWriter()).build();
			User writerInfo = userService.loginUser(user);
			
			board.setBoardWriter(writerInfo.getUserId());
			int existPick = productBoardService.checkPick(board);
					
			mv.addObject("media", media);
			mv.addObject("existPick", existPick);
			mv.addObject("productInfo", productInfo);
			mv.addObject("detailBoard", detailBoard);
			mv.addObject("category", category);
			mv.addObject("writerInfo", writerInfo);
		}
		
		mv.setViewName("productBoard/boardDetailForm");
		return mv;
		
	}
	
	// 찜하기 버튼 클릭 시 테이블에 데이터 등록
	@ResponseBody
	@RequestMapping(value="myPickBoard", produces="html/text;charset=UTF-8")
	public String myPickBoard(ProductBoard board, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		board.setBoardWriter(user.getUserId());
		
		int existPick = productBoardService.checkPick(board);
		
		String msg = "";

		if(existPick == 0) {
			int result = productBoardService.insertMyPick(board);
			
			if(result > 0) {
				msg = "NNNNY";
			}
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
	// 찜한 게시물 삭제하는 메소드
	@ResponseBody
	@RequestMapping(value="myPickBoardDelete", produces="html/text;charset=UTF-8")
	public String myPickBoardDelete(ProductBoard board, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		board.setBoardWriter(user.getUserId());
		
		int existPick = productBoardService.checkPick(board);
		
		String msg = "";

		if(existPick != 0) {
			int result = productBoardService.deleteMyPick(board);
			
			if(result > 0) {
				msg = "NNNNY";
			}
		}
		else {
			msg = "NNNNN";
		}
		
		return msg;
		
	}
	
}
