package com.kh.finalProject.productBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.common.model.vo.Category;
import com.kh.finalProject.common.model.vo.Kind;
import com.kh.finalProject.common.model.vo.Location;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.productBoard.model.dao.ProductBoardDao;
import com.kh.finalProject.productBoard.model.vo.Media;
import com.kh.finalProject.productBoard.model.vo.Notice;
import com.kh.finalProject.productBoard.model.vo.ProductBoard;
import com.kh.finalProject.productBoard.model.vo.ProductInfo;
import com.kh.finalProject.productBoard.model.vo.ProductSearch;
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
	public ArrayList<ProductSearch> searchProduct(String searchValue) {
		
		return productBoardDao.getproductSearch(sqlSession, searchValue);
	}
	
}
