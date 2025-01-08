package com.kh.finalProject.productBoard.model.service;

import java.util.ArrayList;

import com.kh.finalProject.common.model.vo.Category;
import com.kh.finalProject.common.model.vo.ChatInfo;
import com.kh.finalProject.common.model.vo.Kind;
import com.kh.finalProject.common.model.vo.Location;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.model.vo.ReportUser;
import com.kh.finalProject.productBoard.model.vo.Media;
import com.kh.finalProject.productBoard.model.vo.Notice;
import com.kh.finalProject.productBoard.model.vo.ProductBoard;
import com.kh.finalProject.productBoard.model.vo.ProductInfo;
import com.kh.finalProject.productBoard.model.vo.Reply;
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

	// 위치 정보 리스트를 조회하는 메소드
	ArrayList<Location> selectLocationList();

	// 거래방법 리스트를 조회하는 메소드
	ArrayList<Kind> selectKindList();

	// 카테고리 선택 후 상세 카테고리 조회하는 메소드
	ArrayList<Category> selectDetailCateList(Category category);

	// 상품게시판에 게시물을 삽입하는 메소드
	int insertProductBoard(ProductBoard pBoard);

	// 상품게시판 번호를 만들어오는 메소드
	int makeBoardNo();

	// 상품게시판에 게시물 삽입 후 상품 정보테이블에 제품정보 삽입하는 메소드
	int insertProductInfo(ProductInfo pInfo);

	// 상품게시판에 게시물 삽입 후 상품 이미지 (미디어파일)를 삽입하는 메소드
	int insertMediaFile(ArrayList<Media> mList);

	// 최근 작성된 게시물 5개를 조회해오는 메소드
	ArrayList<ProductBoard> selectRecentBoard();

	// 게시글 총 갯수 조회하는 메소드
	int listAllCount();

	// 가장 인기있는(가장 조회수가 높은) 상품 조회 메소드
	ArrayList<ProductBoard> topFiveProduct(PageInfo pi);

	// 카테고리 갯수 조회하는 메소드
	int getCateCount();

	// 카테고리를 5개씩 조회해오는 메소드
	ArrayList<Category> getCate(PageInfo pi);

	// 지역(도)을 조회해오는 필터
	ArrayList<Location> locationFilter();

	// 카테고리를 상세 조회해오는 필터
	ArrayList<Category> categoryDetailFilter(Category category);

	// 지역(시, 구) 상세 조회해오는 메소드
	ArrayList<Location> locationDeep1Filter(Location location);

	// 지역(동) 상세 조회해오는 메소드
	ArrayList<Location> locationDeep2Filter(Location location);

	// 필터 조건에 카테고리가 있는 경우 실행되는 메소드
	Category getCategoryNo(Category category);

	// 필터 조건에 지역이 있는 경우 실행되는 메소드
	ArrayList<Location> getLocationNo(Location location);
	
	// 필터 조건에 맞는 게시물을 조회해오는 메소드
	ArrayList<ProductBoard> searchFilterBoard(ProductBoard board);

	// 상품게시판 리스트에서 상품 클릭시 상세보기 페이지로 이동하는 메소드
	ProductBoard boardDetailForm(ProductBoard board);

	//상품 검색 메소드 
	ArrayList<ProductBoard> searchProduct(String searchValue);
  
	// 상세보기 페이지에서 보여줄 해당 게시물의 카테고리
	Category boardCategory(int categoryNo);

	// 상세보기 페이지에서 보여줄 상품에 대한 정보를 조회해오는 메소드
	ProductInfo selectProductInfo(ProductBoard board);

	// 상세보기 페이지에서 보여줄 상품의 다른 이미지를ㄹ 조회해오는 메소드
	ArrayList<Media> selectMediaFile(ProductBoard board);

	// 상세보기 클릭시 조회수가 증가하는 메소드
	int updateBoardCount(ProductBoard board);

	// 찜하기 버튼 기능 구현 메소드
	int insertMyPick(ProductBoard board);

	// 찜하기 버튼 눌렀는지 확인하는 메소드
	int checkPick(ProductBoard board);

	// 찜하기 버튼을 다시 클릭하면 찜하기 목록 삭제하는 메소드
	int deleteMyPick(ProductBoard board);

	// 게시물 신고 기능 메소드
	int reportBoard(ProductBoard board);

	// 해당 게시물의 유저를 신고하는 메소드
	int insertReport(ReportUser report);

	// 채팅 기록 중복 방지 메소드
	int checkChatDul(ChatInfo chatInfo);

	// 채팅 기록 삽입 메소드
	void insertChatInfo(ChatInfo chatInfo);

	// 상품 게시판 상세페이지에서 판매자의 다른 제품들을 조회해오는 메소드
	ArrayList<ProductBoard> getAnotherList(ProductBoard board);

	// 상품 게시판의 댓글을 조회해오는 메소드
	ArrayList<Reply> getReply(int boardNo);

	// 댓글 작성 메소드
	int insertReply(Reply reply);

	// 상품 게시판을 수정하는 메소드
	int updateProductBoard(ProductBoard pBoard);

	// 상품 정보를 수정하는 메소드
	int updateProductInfo(ProductInfo pInfo);

	// 미디어 파일 삭제하는 메소드
	int deleteMedia(ProductBoard pBoard);

	// 상품 게시판 삭제 메소드
	int pBoardDelete(ProductBoard board);

	// 댓글 신고 메소드
	int replyReport(Reply reply);

	// 댓글 삭제 메소드
	int deleteReply(Reply reply);

	// 댓글 수정 메소드
	int replyUpdate(Reply reply);



}
