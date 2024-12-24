package com.kh.finalProject.productBoard.model.service;

import java.util.ArrayList;

import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.productBoard.model.vo.Notice;
import com.kh.finalProject.productBoard.model.vo.ProductBoard;
import com.kh.finalProject.productBoard.model.vo.Request;
import com.kh.finalProject.productBoard.model.vo.Response;
import com.kh.finalProject.user.model.vo.User;

public interface ProductBoardService {

	// 내가 판매중인 상품 갯수 (페이징용)
	int listCount(User user);
	
	// 내가 판매중인 전체 상품을 가져오는 메소드
	ArrayList<ProductBoard> selectProductAll(User user, PageInfo pi);

	// 현재 판매중인 제품 조회하는 메소드
	ArrayList<ProductBoard> selectProductSell(User user, PageInfo pi);

	// 현재 예약중인 제품 조회하는 메소드
	ArrayList<ProductBoard> selectProductReserv(User user, PageInfo pi);

	// 판매 완료된 제품 조회하는 메소드
	ArrayList<ProductBoard> selectProductDone(User user, PageInfo pi);

	// 공지사항 갯수 조회 메소드
	int noticeCount();

	// 공지사항 리스트 조회해오는 메소드
	ArrayList<Notice> selectNotice(PageInfo pi);

	// 공지사항 조회해오는 메소드
	Notice selectNoticeOne(Notice notice);

	// 공지사항 조회수 증가시키는 메소드
	int updateCount(Notice notice);

	// 공지사항 수정 메소드
	int updateNotice(Notice notice);

	// 공지사항 삭제 메소드
	int deleteNotice(Notice notice);

	// 공지사항 작성 메소드
	int insertNotice(Notice notice);

	// 내가 찜한 상품 갯수 조회 메소드
	int myPickCount(String userId);
	
	// 내가 찜한 목록 조회하는 메소드
	ArrayList<ProductBoard> selectPBList(String userId, PageInfo pi);

	// 구매한 내역 갯수 조회 메소드
	int buyProductCount(String userId);

	// 구매한 내역 조회 메소드
	ArrayList<ProductBoard> buyProductList(String userId, PageInfo pi);

	// 문의 게시판 갯수 조회 메소드
	int requestCount();

	// 문의 게시판 조회 메소드
	ArrayList<Request> requestList(PageInfo pi);

	// 문의 상세보기 조회 메소드
	Request selectRequest(int requestNo);

	// 문의 수정 메소드
	int updateRequest(Request request);

	// 문의 삭제 메소드
	int deleteRequest(int requestNo);

	// 문의 작성 메소드
	int insertRequest(Request request);

	// 문의 응답 작성 메소드
	int insertResponse(Response response);

	// 문의 응답 조회 메소드
	Response selectResponse(Response response);

	// 문의 응답 삭제 메소드
	int deleteResponse(Response response);



}
