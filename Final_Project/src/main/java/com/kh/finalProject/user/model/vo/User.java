package com.kh.finalProject.user.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class User {

	private String userId; //	USER_ID	VARCHAR2(15 BYTE)
	private String userImg; //	USER_IMG	VARCHAR2(500 BYTE)
	private String introContent; //	INTRO_CONTENT	VARCHAR2(1000 BYTE)
	private String userPwd; //	USER_PWD	VARCHAR2(30 BYTE)
	private String userName; //	USER_NAME	VARCHAR2(30 BYTE)
	private int age; //	AGE	NUMBER
	private String nickname; //	NICKNAME	VARCHAR2(30 BYTE)
	private String email; //	EMAIL	VARCHAR2(50 BYTE)
	private String phone; //	PHONE	VARCHAR2(30 BYTE)
	private String gender; //	GENDER	VARCHAR2(1 BYTE)
	private String address; //	ADDRESS	VARCHAR2(500 BYTE)
	private String userDeclaration; //	USER_DECLARATION	VARCHAR2(1 BYTE)
	private int warnningCount; //	WARRNING_COUNT	NUMBER
	private String idUseless; //	ID_USELESS	VARCHAR2(1 BYTE)
	private Date createDate; //	CREATE_DATE	DATE
	private Date modifyDate; //	MODIFY_DATE	DATE
	private int khPay; // KH 페이 (안전거래용 포인트)
	private double trustPoint; // 신뢰도
	private String status; // 회원 탈퇴여부 기본값 N
	
}
