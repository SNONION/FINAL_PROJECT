package com.kh.finalProject.productBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.common.model.vo.AddressInfo;
import com.kh.finalProject.common.model.vo.BoardCategory;
import com.kh.finalProject.common.model.vo.Category;
import com.kh.finalProject.common.model.vo.ChatInfo;
import com.kh.finalProject.common.model.vo.Kind;
import com.kh.finalProject.common.model.vo.Location;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.model.vo.ReportUser;
import com.kh.finalProject.productBoard.model.dao.ProductBoardDao;
import com.kh.finalProject.productBoard.model.vo.AreaBoard;
import com.kh.finalProject.productBoard.model.vo.AreaBoardReply;
import com.kh.finalProject.productBoard.model.vo.Media;
import com.kh.finalProject.productBoard.model.vo.Notice;
import com.kh.finalProject.productBoard.model.vo.ProductBoard;
import com.kh.finalProject.productBoard.model.vo.ProductInfo;
import com.kh.finalProject.productBoard.model.vo.ReReply;
import com.kh.finalProject.productBoard.model.vo.Reply;
import com.kh.finalProject.productBoard.model.vo.Request;
import com.kh.finalProject.productBoard.model.vo.Response;
import com.kh.finalProject.user.model.vo.User;

@Service
public class ProductBoardServiceImpl implements ProductBoardService{

	@Autowired
	private ProductBoardDao productBoardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int listCount(User user) {
		
		return productBoardDao.listCount(sqlSession, user);
	}
	
	@Override
	public ArrayList<ProductBoard> selectProductAll(User user, PageInfo pi) {
		
		return productBoardDao.selectProductAll(sqlSession, user, pi);
	}

	@Override
	public ArrayList<ProductBoard> selectProductSell(User user, PageInfo pi) {
		
		return productBoardDao.selectProductSell(sqlSession, user, pi);
	}

	@Override
	public ArrayList<ProductBoard> selectProductReserv(User user, PageInfo pi) {
		
		return productBoardDao.selectProductReserv(sqlSession, user, pi);
	}

	@Override
	public ArrayList<ProductBoard> selectProductDone(User user, PageInfo pi) {
		
		return productBoardDao.selectProductDone(sqlSession, user, pi);
	}

	@Override
	public int noticeCount() {
		
		return productBoardDao.noticeCount(sqlSession);
	}
	
	@Override
	public ArrayList<Notice> selectNotice(PageInfo pi) {
		
		return productBoardDao.selectNotice(sqlSession, pi);
	}

	
	@Override
	public Notice selectNoticeOne(Notice notice) {
		
		return productBoardDao.selectNoticeOne(sqlSession, notice);
	}

	@Override
	public int updateCount(Notice notice) {
		
		return productBoardDao.updateCount(sqlSession, notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		
		return productBoardDao.updateNotice(sqlSession, notice);
	}

	@Override
	public int deleteNotice(Notice notice) {
		
		return productBoardDao.deleteNotice(sqlSession, notice);
	}

	@Override
	public int insertNotice(Notice notice) {
		
		return productBoardDao.insertNotice(sqlSession, notice);
	}

	@Override
	public int myPickCount(String userId) {
		
		return productBoardDao.myPickCount(sqlSession, userId);
	}
	
	@Override
	public ArrayList<ProductBoard> selectPBList(String userId, PageInfo pi) {
		
		return productBoardDao.selectPBList(sqlSession, userId, pi);
	}

	@Override
	public int buyProductCount(String userId) {
		
		return productBoardDao.buyProductCount(sqlSession, userId);
	}

	@Override
	public ArrayList<ProductBoard> buyProductList(String userId, PageInfo pi) {
		
		return productBoardDao.buyProductList(sqlSession, userId, pi);
	}

	@Override
	public int requestCount() {
		
		return productBoardDao.requestCount(sqlSession);
	}

	@Override
	public ArrayList<Request> requestList(PageInfo pi) {
		
		return productBoardDao.requestList(sqlSession, pi);
	}

	@Override
	public Request selectRequest(int requestNo) {
		
		return productBoardDao.selectRequest(sqlSession, requestNo);
	}

	@Override
	public int updateRequest(Request request) {
		
		return productBoardDao.updateRequest(sqlSession, request);
	}

	@Override
	public int deleteRequest(int requestNo) {
		
		return productBoardDao.deleteRequest(sqlSession, requestNo);
	}

	@Override
	public int insertRequest(Request request) {
		
		return productBoardDao.insertRequest(sqlSession, request);
	}

	@Override
	public int insertResponse(Response response) {
		
		return productBoardDao.insertResponse(sqlSession, response);
	}

	@Override
	public Response selectResponse(Response response) {
		
		return productBoardDao.selectResponse(sqlSession, response);
	}

	@Override
	public int deleteResponse(Response response) {
		
		return productBoardDao.deleteResponse(sqlSession, response);
	}

	@Override
	public ArrayList<Location> selectLocationList() {
		
		return productBoardDao.selectLocationList(sqlSession);
	}

	@Override
	public ArrayList<Kind> selectKindList() {
		
		return productBoardDao.selectKindList(sqlSession);
	}

	@Override
	public ArrayList<Category> selectDetailCateList(Category category) {
		
		return productBoardDao.selectDetailCateList(sqlSession, category);
	}

	@Override
	public int insertProductBoard(ProductBoard pBoard) {
		
		return productBoardDao.insertProductBoard(sqlSession, pBoard);
	}

	@Override
	public int makeBoardNo() {
		
		return productBoardDao.makeBoardNo(sqlSession);
	}
	
	@Override
	public int insertProductInfo(ProductInfo pInfo) {
		
		return productBoardDao.insertProductInfo(sqlSession, pInfo);
	}

	@Override
	public int insertMediaFile(ArrayList<Media> mList) {
		
		return productBoardDao.insertMediaFile(sqlSession, mList);
	}

	@Override
	public ArrayList<ProductBoard> selectRecentBoard() {
		
		return productBoardDao.selectRecentBoard(sqlSession);
	}

	@Override
	public int listAllCount() {
		
		return productBoardDao.listAllCount(sqlSession);
	}
	
	@Override
	public ArrayList<ProductBoard> topFiveProduct(PageInfo pi) {
		
		return productBoardDao.topFiveProduct(sqlSession, pi);
	}

	@Override
	public int getCateCount() {

		return productBoardDao.getCateCount(sqlSession);
	}

	@Override
	public ArrayList<Category> getCate(PageInfo pi) {
		
		return productBoardDao.getCate(sqlSession, pi);
	}

	@Override
	public ArrayList<Location> locationFilter() {
		
		return productBoardDao.locationFilter(sqlSession);
	}
	
	@Override
	public ArrayList<Category> categoryDetailFilter(Category category) {
		
		return productBoardDao.categoryDetailFilter(sqlSession, category);
	}

	@Override
	public ArrayList<Location> locationDeep1Filter(Location location) {
		
		return productBoardDao.locationDeep1Filter(sqlSession, location);
	}
	
	@Override
	public ArrayList<Location> locationDeep2Filter(Location location) {
		
		return productBoardDao.locationDeep2Filter(sqlSession, location);
	}

	@Override
	public Category getCategoryNo(Category category) {
		
		return productBoardDao.getCategoryNo(sqlSession, category);
	}

	@Override
	public ArrayList<Location> getLocationNo(Location location) {
		
		return productBoardDao.getLocationNo(sqlSession, location);
	}

	@Override
	public ArrayList<ProductBoard> searchFilterBoard(ProductBoard board) {
		
		return productBoardDao.searchFilterBoard(sqlSession, board);
	}

	@Override
	public ProductBoard boardDetailForm(ProductBoard board) {
		
		return productBoardDao.boardDetailForm(sqlSession, board);
	}

	@Override
	public ArrayList<ProductBoard> searchProduct(String searchValue) {
		
		return productBoardDao.getproductSearch(sqlSession, searchValue);
	}
	
	public Category boardCategory(int categoryNo) {
		
		return productBoardDao.boardCategory(sqlSession, categoryNo);
	}

	@Override
	public ProductInfo selectProductInfo(ProductBoard board) {
		
		return productBoardDao.selectProductInfo(sqlSession, board);
	}

	@Override
	public ArrayList<Media> selectMediaFile(ProductBoard board) {
		
		return productBoardDao.selectMediaFile(sqlSession, board);
	}

	@Override
	public int updateBoardCount(ProductBoard board) {
		
		return productBoardDao.updateBoardCount(sqlSession, board);
	}

	@Override
	public int insertMyPick(ProductBoard board) {
		
		return productBoardDao.insertMyPick(sqlSession, board);
	}

	@Override
	public int checkPick(ProductBoard board) {
		
		return productBoardDao.checkPick(sqlSession, board);
	}

	@Override
	public int deleteMyPick(ProductBoard board) {
		
		return productBoardDao.deleteMyPick(sqlSession, board);
	}

	@Override
	public int reportBoard(ProductBoard board) {
		
		return productBoardDao.reportBoard(sqlSession, board);
	}

	@Override
	public int insertReport(ReportUser report) {
		
		return productBoardDao.insertReport(sqlSession, report);
	}

	@Override
	public int checkChatDul(ChatInfo chatInfo) {
		
		return productBoardDao.checkChatDul(sqlSession, chatInfo);
	}

	@Override
	public void insertChatInfo(ChatInfo chatInfo) {
		
		productBoardDao.insertChatInfo(sqlSession, chatInfo);
	}

	@Override
	public ArrayList<ProductBoard> getAnotherList(ProductBoard board) {
		
		return productBoardDao.getAnotherList(sqlSession, board);
	}
	
	@Override
	public ArrayList<ProductBoard> declarationBoard() {
		
		return productBoardDao.declarationBoard(sqlSession);
	}
	
	
	
	@Override
	public ArrayList<Reply> getReply(int boardNo) {
		
		return productBoardDao.getReply(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply reply) {
		
		return productBoardDao.insertReply(sqlSession, reply);
	}

	@Override
	public int updateProductBoard(ProductBoard pBoard) {
		
		return productBoardDao.updateProductBoard(sqlSession, pBoard);
	}

	@Override
	public int updateProductInfo(ProductInfo pInfo) {
		
		return productBoardDao.updateProductInfo(sqlSession, pInfo);
	}

	@Override
	public int deleteMedia(ProductBoard pBoard) {
		
		return productBoardDao.deleteMedia(sqlSession, pBoard);
	}

	@Override
	public int pBoardDelete(ProductBoard board) {
		
		return productBoardDao.pBoardDelete(sqlSession, board);
	}

	@Override
	public int replyReport(Reply reply) {
		
		return productBoardDao.replyReport(sqlSession, reply);
	}

	@Override
	public int deleteReply(Reply reply) {
		
		return productBoardDao.deleteReply(sqlSession, reply);
	}

	@Override
	public int replyUpdate(Reply reply) {
		
		return productBoardDao.replyUpdate(sqlSession, reply);
	}

	@Override
	public int insertReplyToReply(ReReply reReply) {
		
		return productBoardDao.insertReplyToReply(sqlSession, reReply);
	}

	@Override
	public ArrayList<ReReply> getReplyReply(ReReply reReply) {
		
		return productBoardDao.getReplyReply(sqlSession, reReply);
	}

	@Override
	public ArrayList<Reply> declarationReply() {
		return productBoardDao.declarationReply(sqlSession);
	}
	
	public int redeleteReply(ReReply rereply) {
		
		return productBoardDao.getredeleteReply(sqlSession, rereply);
	}

	@Override
	public int rereplyUpdate(ReReply rereply) {
		
		return productBoardDao.getrereplyUpdate(sqlSession, rereply);
	}
	
	@Override
	public int rereplyReport(ReReply rereply) {
		
		return productBoardDao.rereplyReport(sqlSession, rereply);
	}
	
	public ArrayList<AreaBoard> areaBoardForm(int address, PageInfo pi) {
		
		return productBoardDao.areaBoardForm(sqlSession, address, pi);
	}

	@Override
	public ArrayList<AreaBoard> areaBoardForm(PageInfo pi) {
		
		return productBoardDao.areaBoardForm(sqlSession, pi);
	}

	@Override
	public int AreaBoardCount(int locationNo) {
		
		return productBoardDao.AreaBoardCount(sqlSession, locationNo);
	}

	@Override
	public int AreaBoardCount() {
		
		return productBoardDao.AreaBoardCount(sqlSession);
	}

	@Override
	public ArrayList<BoardCategory> getBoardCate() {
		
		return productBoardDao.getBoardCate(sqlSession);
	}

	@Override
	public int insertAreaBoard(AreaBoard board) {
		
		return productBoardDao.insertAreaBoard(sqlSession, board);
	}

	@Override
	public AreaBoard selectAreaBoard(int areaNo) {
		
		return productBoardDao.selectAreaBoard(sqlSession, areaNo);
	}

	@Override
	public int updateCount(int areaNo) {
		
		return productBoardDao.updateCount(sqlSession, areaNo);
	}

	@Override
	public int deleteAreaBoard(int areaNo) {
		
		return productBoardDao.deleteAreaBoard(sqlSession, areaNo);
	}

	@Override
	public int updateAreaBoard(AreaBoard board) {
		
		return productBoardDao.updateAreaBoard(sqlSession, board);
	}

	@Override
	public int insertBoardReply(AreaBoardReply reply) {
		
		return productBoardDao.insertBoardReply(sqlSession, reply);
	}

	@Override
	public ArrayList<AreaBoardReply> selectAreaBoardReply(AreaBoardReply reply) {
		
		return productBoardDao.selectAreaBoardReply(sqlSession, reply);
	}

	@Override
	public int getCountCateList(AreaBoard ab) {
		
		return productBoardDao.getCountCateList(sqlSession, ab);
	}
	
	@Override
	public ArrayList<AreaBoard> selectCateAreaBoard(AreaBoard ab, PageInfo pi) {
		
		return productBoardDao.selectCateAreaBoard(sqlSession, ab, pi);
	}

  
}
