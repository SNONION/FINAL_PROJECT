package com.kh.finalProject.productBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.productBoard.model.vo.Notice;
import com.kh.finalProject.productBoard.model.vo.ProductBoard;
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
		int offset = (pi.getCurrentPage() - 1) + limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectProductAll", user, new RowBounds(offset, limit));
	}

	public ArrayList<ProductBoard> selectProductSell(SqlSessionTemplate sqlSession, User user, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) + limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectProductSell", user, new RowBounds(offset, limit));
	}

	public ArrayList<ProductBoard> selectProductReserv(SqlSessionTemplate sqlSession, User user, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) + limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectProductReserv", user, new RowBounds(offset, limit));
	}

	public ArrayList<ProductBoard> selectProductDone(SqlSessionTemplate sqlSession, User user, PageInfo pi) {

		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) + limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectProductDone", user, new RowBounds(offset, limit));
	}

	public int noticeCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productBoardMapper.noticeCount");
	}

	public ArrayList<Notice> selectNotice(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit =pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) + limit;
		
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
		int offset = (pi.getCurrentPage() - 1) + limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.selectPBList", userId, new RowBounds(offset, limit));
	}

	public int buyProductCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("productBoardMapper.buyProductCount", userId);
	}

	public ArrayList<ProductBoard> buyProductList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) + limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.buyProductList", userId, new RowBounds(offset, limit));
	}

	public int requestCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productBoardMapper.requestCount");
	}

	public ArrayList<Request> requestList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getListLimit();
		int offset = (pi.getCurrentPage() - 1) + limit;
		
		return (ArrayList)sqlSession.selectList("productBoardMapper.requestList", new RowBounds(offset, limit));
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



}
