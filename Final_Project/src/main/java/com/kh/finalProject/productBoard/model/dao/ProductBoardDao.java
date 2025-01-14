package com.kh.finalProject.productBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.common.model.vo.BoardCategory;
import com.kh.finalProject.common.model.vo.Category;
import com.kh.finalProject.common.model.vo.ChatInfo;
import com.kh.finalProject.common.model.vo.Kind;
import com.kh.finalProject.common.model.vo.Location;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.model.vo.ReportUser;
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

@Repository
public class ProductBoardDao {

	public int listCount(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.selectOne("productBoardMapper.listCount", user);
	}
	
	public ArrayList<ProductBoard> selectProductAll(SqlSessionTemplate sqlSession, User user, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectProductAll", user, new RowBounds(offset, limit));
	}

	public ArrayList<ProductBoard> selectProductSell(SqlSessionTemplate sqlSession, User user, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectProductSell", user, new RowBounds(offset, limit));
	}

	public ArrayList<ProductBoard> selectProductReserv(SqlSessionTemplate sqlSession, User user, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectProductReserv", user, new RowBounds(offset, limit));
	}

	public ArrayList<ProductBoard> selectProductDone(SqlSessionTemplate sqlSession, User user, PageInfo pi) {

		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectProductDone", user, new RowBounds(offset, limit));
	}

	public int noticeCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productBoardMapper.noticeCount");
	}

	public ArrayList<Notice> selectNotice(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit =pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectNotice", new RowBounds(offset, limit));
		
	}

	public Notice selectNoticeOne(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.selectOne("productBoardMapper.selectNoticeOne", notice);
	}

	public int updateCount(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.update("productBoardMapper.updateCount", notice);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.update("productBoardMapper.updateNotice", notice);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.delete("productBoardMapper.deleteNotice", notice);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.insert("productBoardMapper.insertNotice", notice);
	}

	public int myPickCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("productBoardMapper.myPickCount", userId);
	}
	
	public ArrayList<ProductBoard> selectPBList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectPBList", userId, new RowBounds(offset, limit));
	}

	public int buyProductCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("productBoardMapper.buyProductCount", userId);
	}

	public ArrayList<ProductBoard> buyProductList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.buyProductList", userId, new RowBounds(offset, limit));
	}

	public int requestCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productBoardMapper.requestCount");
	}

	public ArrayList<Request> requestList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.requestList", null, new RowBounds(offset, limit));
	}

	public Request selectRequest(SqlSessionTemplate sqlSession, int requestNo) {
		
		return sqlSession.selectOne("productBoardMapper.selectRequest", requestNo);
	}

	public int updateRequest(SqlSessionTemplate sqlSession, Request request) {
		
		return sqlSession.update("productBoardMapper.updateRequest", request);
	}

	public int deleteRequest(SqlSessionTemplate sqlSession, int requestNo) {
		
		return sqlSession.update("productBoardMapper.deleteRequest", requestNo);
	}

	public int insertRequest(SqlSessionTemplate sqlSession, Request request) {
		
		return sqlSession.insert("productBoardMapper.insertRequest", request);
	}

	public int insertResponse(SqlSessionTemplate sqlSession, Response response) {
		
		return sqlSession.insert("productBoardMapper.insertResponse", response);
	}

	public Response selectResponse(SqlSessionTemplate sqlSession, Response response) {
		
		return sqlSession.selectOne("productBoardMapper.selectResponse", response);
	}

	public int deleteResponse(SqlSessionTemplate sqlSession, Response response) {
		
		return sqlSession.delete("productBoardMapper.deleteResponse", response);
	}

	public ArrayList<Location> selectLocationList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectLocationList");
	}

	public ArrayList<Kind> selectKindList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectKindList");
	}

	public ArrayList<Category> selectDetailCateList(SqlSessionTemplate sqlSession, Category category) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectDetailCateList", category);
	}

	public int insertProductBoard(SqlSessionTemplate sqlSession, ProductBoard pBoard) {
		
		return sqlSession.insert("productBoardMapper.insertProductBoard", pBoard);
	}

	public int insertProductInfo(SqlSessionTemplate sqlSession, ProductInfo pInfo) {
		
		return sqlSession.insert("productBoardMapper.insertProductInfo", pInfo);
	}

	public int makeBoardNo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productBoardMapper.makeBoardNo");
	}

	public int insertMediaFile(SqlSessionTemplate sqlSession, ArrayList<Media> mList) {
		
		return sqlSession.insert("productBoardMapper.insertMediaFile", mList);
	}

	public ArrayList<ProductBoard> selectRecentBoard(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectRecentBoard");
	}

	public int listAllCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productBoardMapper.listAllCount");
	}
	
	public ArrayList<ProductBoard> topFiveProduct(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.topFiveProduct", null, new RowBounds(offset, limit));
	}

	public int getCateCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productBoardMapper.getCateCount");
	}

	public ArrayList<Category> getCate(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.getCate", null, new RowBounds(offset, limit));
	}

	public ArrayList<Category> categoryDetailFilter(SqlSessionTemplate sqlSession, Category category) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.categoryDetailFilter", category);
	}

	public ArrayList<Location> locationFilter(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.locationFilter");
	}

	public ArrayList<Location> locationDeep1Filter(SqlSessionTemplate sqlSession, Location location) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.locationDeep1Filter", location);
	}
	
	public ArrayList<Location> locationDeep2Filter(SqlSessionTemplate sqlSession, Location location) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.locationDeep2Filter", location);
	}

	public Category getCategoryNo(SqlSessionTemplate sqlSession, Category category) {
		
		return sqlSession.selectOne("productBoardMapper.getCategoryNo", category);
	}

	public ArrayList<Location> getLocationNo(SqlSessionTemplate sqlSession, Location location) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.getLocationNo", location);
	}

	public ArrayList<ProductBoard> searchFilterBoard(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.searchFilterBoard", board);
	}

	public ProductBoard boardDetailForm(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return sqlSession.selectOne("productBoardMapper.boardDetailForm", board);
	}
	
	public ArrayList<ProductBoard> getproductSearch(SqlSessionTemplate sqlSession, String searchValue) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.productSearch", searchValue);
	}
	
	

	public Category boardCategory(SqlSessionTemplate sqlSession, int categoryNo) {
		
		return sqlSession.selectOne("productBoardMapper.boardCategory", categoryNo);
	}

	public ProductInfo selectProductInfo(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return sqlSession.selectOne("productBoardMapper.selectProductInfo", board);
	}

	public ArrayList<Media> selectMediaFile(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectMediaFile", board);
	}

	public int updateBoardCount(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return sqlSession.update("productBoardMapper.updateBoardCount", board);
	}

	public int insertMyPick(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return sqlSession.insert("productBoardMapper.insertMyPick", board);
	}

	public int checkPick(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return sqlSession.selectOne("productBoardMapper.checkPick", board);
	}

	public int deleteMyPick(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return sqlSession.delete("productBoardMapper.deleteMyPick", board);
	}

	public int reportBoard(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return sqlSession.update("productBoardMapper.reportBoard", board);
	}

	public int insertReport(SqlSessionTemplate sqlSession, ReportUser report) {
		
		return sqlSession.insert("productBoardMapper.insertReport", report);
	}

	public int checkChatDul(SqlSessionTemplate sqlSession, ChatInfo chatInfo) {
		
		return sqlSession.selectOne("productBoardMapper.checkChatDul", chatInfo);
	}

	public void insertChatInfo(SqlSessionTemplate sqlSession, ChatInfo chatInfo) {
		
		sqlSession.insert("productBoardMapper.insertChatInfo", chatInfo);
	}

	public ArrayList<ProductBoard> getAnotherList(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.getAnotherList", board);
	}

	public ArrayList<Reply> getReply(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.getReply", boardNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		
		return sqlSession.insert("productBoardMapper.insertReply", reply);
	}

	public int updateProductBoard(SqlSessionTemplate sqlSession, ProductBoard pBoard) {
		
		return sqlSession.update("productBoardMapper.updateProductBoard", pBoard);
	}

	public int updateProductInfo(SqlSessionTemplate sqlSession, ProductInfo pInfo) {
		
		return sqlSession.update("productBoardMapper.updateProductInfo", pInfo);
	}

	public int deleteMedia(SqlSessionTemplate sqlSession, ProductBoard pBoard) {
		
		return sqlSession.delete("productBoardMapper.deleteMedia", pBoard);
	}

	public int pBoardDelete(SqlSessionTemplate sqlSession, ProductBoard board) {
		
		return sqlSession.delete("productBoardMapper.pBoardDelete", board);
	}

	public int replyReport(SqlSessionTemplate sqlSession, Reply reply) {
		
		return sqlSession.update("productBoardMapper.replyReport", reply);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Reply reply) {
		
		return sqlSession.delete("productBoardMapper.deleteReply", reply);
	}

	public int replyUpdate(SqlSessionTemplate sqlSession, Reply reply) {
		
		return sqlSession.update("productBoardMapper.replyUpdate", reply);
	}

	public int insertReplyToReply(SqlSessionTemplate sqlSession, ReReply reReply) {
		
		return sqlSession.insert("productBoardMapper.insertReplyToReply", reReply);
	}

	public ArrayList<ReReply> getReplyReply(SqlSessionTemplate sqlSession, ReReply reReply) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.getReplyReply", reReply);
	}
	
	public ArrayList<ProductBoard> declarationBoard(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.declarationBoard");
	}

	public ArrayList<Reply> declarationReply(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.declarationReply");
	}

	public int getredeleteReply(SqlSessionTemplate sqlSession, ReReply rereply) {
		
		return sqlSession.delete("productBoardMapper.redeleteReply", rereply);
	}

	public int getrereplyUpdate(SqlSessionTemplate sqlSession, ReReply rereply) {
		
		return sqlSession.update("productBoardMapper.rereplyUpdate", rereply);
	}
	
	public int rereplyReport(SqlSessionTemplate sqlSession, ReReply rereply) {
		
		return sqlSession.update("productBoardMapper.rereplyReport", rereply);
  }
  
	public ArrayList<AreaBoard> areaBoardForm(SqlSessionTemplate sqlSession, int address, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.areaBoardForm1", address, new RowBounds(offset, limit));
	}

	public ArrayList<AreaBoard> areaBoardForm(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.areaBoardForm2", new RowBounds(offset, limit));
	}

	public int AreaBoardCount(SqlSessionTemplate sqlSession, int locationNo) {
		
		return sqlSession.selectOne("productBoardMapper.AreaBoardCount1", locationNo);
	}

	public int AreaBoardCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productBoardMapper.AreaBoardCount2");
	}

	public ArrayList<BoardCategory> getBoardCate(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.getBoardCate");
	}

	public int insertAreaBoard(SqlSessionTemplate sqlSession, AreaBoard board) {
		
		return sqlSession.insert("productBoardMapper.insertAreaBoard", board);
	}

	public AreaBoard selectAreaBoard(SqlSessionTemplate sqlSession, int areaNo) {
		
		return sqlSession.selectOne("productBoardMapper.selectAreaBoard", areaNo);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int areaNo) {
		
		return sqlSession.update("productBoardMapper.updateCountArea", areaNo);
	}

	public int deleteAreaBoard(SqlSessionTemplate sqlSession, int areaNo) {
		
		return sqlSession.delete("productBoardMapper.deleteAreaBoard", areaNo);
	}

	public int updateAreaBoard(SqlSessionTemplate sqlSession, AreaBoard board) {
		
		return sqlSession.update("productBoardMapper.updateAreaBoard", board);
	}

	public int insertBoardReply(SqlSessionTemplate sqlSession, AreaBoardReply reply) {
		
		return sqlSession.insert("productBoardMapper.insertBoardReply", reply);
	}

	public ArrayList<AreaBoardReply> selectAreaBoardReply(SqlSessionTemplate sqlSession, AreaBoardReply reply) {
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectAreaBoardReply", reply);
	}

	public ArrayList<AreaBoard> selectCateAreaBoard(SqlSessionTemplate sqlSession, AreaBoard ab, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectCateAreaBoard", ab, new RowBounds(offset, limit));
	}

	public int getCountCateList(SqlSessionTemplate sqlSession, AreaBoard ab) {
		
		return sqlSession.selectOne("productBoardMapper.getCountCateList", ab);
	}


}
