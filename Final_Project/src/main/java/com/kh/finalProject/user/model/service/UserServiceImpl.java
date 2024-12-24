package com.kh.finalProject.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.common.model.vo.Category;
import com.kh.finalProject.common.model.vo.Location;
import com.kh.finalProject.user.model.dao.UserDao;
import com.kh.finalProject.user.model.vo.Agree;
import com.kh.finalProject.user.model.vo.User;
import com.kh.finalProject.user.model.vo.UserInfo;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao userDao;

	@Override
	public User loginUser(User user) {
		
		return userDao.loginUser(sqlSession, user);
	}

	@Override
	public User checkId(String userId) {
		
		return userDao.checkId(sqlSession, userId);
	}

	@Override
	public User nicknameCheck(String nickname) {
		
		return userDao.nicknameCheck(sqlSession, nickname);
	}

	@Override
	public int insertAgree(Agree agree) {

		return userDao.insertAgree(sqlSession,agree);
	}

	@Override
	public int insertUser(User user) {
		
		return userDao.insertUser(sqlSession, user);
	}

	@Override
	public ArrayList<Category> getCategory() {
		
		return userDao.getCategory(sqlSession);
	}

	@Override
	public UserInfo selectInfo(String userId) {
		
		return userDao.selectInfo(sqlSession, userId);
	}

	@Override
	public int updateAddress(User user) {
		
		return userDao.updateAddress(sqlSession, user);
	}

	@Override
	public int updateOtherInfo(User user) {
		
		return userDao.updateOtherInfo(sqlSession, user);
	}

	@Override
	public int changeProfileImg(User loginUser) {
		
		return userDao.changeProfileImg(sqlSession, loginUser);
	}

	@Override
	public int changeIntro(User user) {
		
		return userDao.changeIntro(sqlSession, user);
	}

	@Override
	public int updateNickname(User user) {
		
		return userDao.updateNickname(sqlSession, user);
	}

	@Override
	public Location checkLocationDul(Location locationInfo) {
		
		return userDao.checkLocationDul(sqlSession, locationInfo);
	}

	@Override
	public int insertLocationFilter(Location locationInfo) {
		
		return userDao.insertLocationFilter(sqlSession, locationInfo);
	}

}
