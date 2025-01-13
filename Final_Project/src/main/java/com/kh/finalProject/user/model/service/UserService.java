package com.kh.finalProject.user.model.service;

import java.util.ArrayList;

import com.kh.finalProject.common.model.vo.Category;
import com.kh.finalProject.common.model.vo.ChatInfo;
import com.kh.finalProject.common.model.vo.Location;
import com.kh.finalProject.user.model.vo.Agree;
import com.kh.finalProject.user.model.vo.User;
import com.kh.finalProject.user.model.vo.UserInfo;
import com.kh.finalProject.user.model.vo.Warning;

public interface UserService {

	// 로그인 메소드
	User loginUser(User user);

	// 아이디 중복확인 메소드
	User checkId(String userId);

	// 닉네임 중복확인 메소드
	User nicknameCheck(String nickname);

	// 개인 정보 동의 삽입 메소드
	int insertAgree(Agree agree);

	// 회원가입 메소드
	int insertUser(User user);

	// 카테고리 가져오는 메소드 (헤더)
	ArrayList<Category> getCategory();

	// 판매 / 구매 / 거래후기 작성 횟수 조회 메소드
	UserInfo selectInfo(String userId);

	// 회원 주소 변경 메소드
	int updateAddress(User user);

	// 이메일 , 핸드폰 번호 수정 메소드
	int updateOtherInfo(User user);

	// 회원 프로필 사진 변경하는 메소드
	int changeProfileImg(User loginUser);

	// 회원 소개글 수정 메소드
	int changeIntro(User user);

	// 닉네임 변경하는 메소드
	int updateNickname(User user);

	// 위치정보 (시/도 , 구 , 동) 중복확인
	Location checkLocationDul(Location locationInfo);

	// 중복되는 위치가 없는 경우 위치정보를 필터에 삽입 하는 메소드
	int insertLocationFilter(Location locationInfo);

	// 회원 탈퇴 메소드
	int deleteUserInfo(User loginUser);

	// 로그인한 유저의 채팅 기록을 가져오는 메소드
	ArrayList<ChatInfo> getChatRecord(String nickname);
	
	// 신고 받은 유저 조회해오는 메소드
	ArrayList<Warning> warningList();

	// 신고 받은 유저를 삽입하는 메소드
	int insertWarningUser(Warning warning);

	// 신고 당한 상태인지 확인하는 메소드
	int checkDeclaration(Warning warning);

	// 유저의 닉네임으로 유저이미지를 가져오는 메소드
	User getUserImg(User user);

}
