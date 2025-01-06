package com.kh.finalProject.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class ChatInfo {

	private int chatNo; //	CHAT_NO	NUMBER
	private String sellerId; //	SELLER_ID	VARCHAR2(15 BYTE)
	private String buyerId; //	BUYER_ID	VARCHAR2(15 BYTE)
	private String fileFullName; //	FILE_FULLNAME	VARCHAR2(1000 BYTE)
	private Date createDate; //	CREATE_DATE	DATE
	
}
