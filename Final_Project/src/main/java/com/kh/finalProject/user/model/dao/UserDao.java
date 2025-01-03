package com.kh.finalProject.user.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.common.model.vo.Category;
import com.kh.finalProject.common.model.vo.ChatInfo;
import com.kh.finalProject.common.model.vo.Location;
import com.kh.finalProject.user.model.vo.Agree;
import com.kh.finalProject.user.model.vo.User;
import com.kh.finalProject.user.model.vo.UserInfo;

@Repository
public class UserDao {

	public User loginUser(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.selectOne("userMapper.loginUser", user);
	}

	public User checkId(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("userMapper.loginUser", userId);
	}

	public User nicknameCheck(SqlSessionTemplate sqlSession, String nickname) {
		
		return sqlSession.selectOne("userMapper.nicknameCheck", nickname);
	}

	public int insertAgree(SqlSessionTemplate sqlSession, Agree agree) {
		
		return sqlSession.insert("userMapper.insertAgree", agree);
	}

	public int insertUser(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.insert("userMapper.insertUser", user);
	}

	public ArrayList<Category> getCategory(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("userMapper.getCategory");
	}

	public UserInfo selectInfo(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("userMapper.selectInfo", userId);
	}

	public int updateAddress(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.update("userMapper.updateAddress", user);
	}

	public int updateOtherInfo(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.update("userMapper.updateOtherInfo", user);
	}

	public int changeProfileImg(SqlSessionTemplate sqlSession, User loginUser) {
		
		return sqlSession.update("userMapper.changeProfileImg", loginUser);
	}

	public int changeIntro(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.update("userMapper.changeIntro", user);
	}

	public int updateNickname(SqlSessionTemplate sqlSession, User user) {
		
		return sqlSession.update("userMapper.updateNickname", user);
	}

	public Location checkLocationDul(SqlSessionTemplate sqlSession, Location locationInfo) {
		
		return sqlSession.selectOne("userMapper.checkLocationDul", locationInfo);
	}

	public int insertLocationFilter(SqlSessionTemplate sqlSession, Location locationInfo) {
		
		return sqlSession.insert("userMapper.insertLocationFilter", locationInfo);
	}

	public int deleteUserInfo(SqlSessionTemplate sqlSession, User loginUser) {
		
		return sqlSession.update("userMapper.deleteUserInfo", loginUser);
	}

	public ArrayList<ChatInfo> getChatRecord(SqlSessionTemplate sqlSession, String nickname) {
		
		return (ArrayList)sqlSession.selectList("userMapper.getChatRecord", nickname);
	}

}
