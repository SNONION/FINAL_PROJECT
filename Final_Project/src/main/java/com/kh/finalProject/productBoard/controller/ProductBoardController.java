package com.kh.finalProject.productBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.PageNation;
import com.kh.finalProject.productBoard.model.service.ProductBoardService;
import com.kh.finalProject.productBoard.model.vo.Notice;
import com.kh.finalProject.productBoard.model.vo.ProductBoard;
import com.kh.finalProject.productBoard.model.vo.Request;
import com.kh.finalProject.productBoard.model.vo.Response;
import com.kh.finalProject.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class ProductBoardController {
	
	@Autowired
	private ProductBoardService productBoardService;
	
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
	

}
