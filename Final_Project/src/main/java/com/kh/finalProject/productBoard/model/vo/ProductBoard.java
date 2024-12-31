package com.kh.finalProject.productBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ProductBoard {

	private int boardNo; //	BOARD_NO	NUMBER O
	private String boardWriter; //	BOARD_WRITER	VARCHAR2(15 BYTE)
	private int categoryNo; //	CATEGORY_NO	NUMBER O
	private String sellLocation; //	SELL_LOCATION	VARCHAR2(500 BYTE)
	private int kindNo; //	KIND_NO	NUMBER O
	private String productStatus; //	PRODUCT_STATUS	VARCHAR2(10 BYTE) O
	private String boardTitle; //	BOARD_TITLE	VARCHAR2(1000 BYTE) O
	private String BoardContent; //	BOARD_CONTENT	VARCHAR2(4000 BYTE) O
	private int price;//	PRICE	NUMBER O
	private int count; //	COUNT	NUMBER
	private String tradeSellStatus; //	TRADE_SELL_STATUS	VARCHAR2(1 BYTE) O
	private String tradeBuyStatus; //	TRADE_BUY_STATUS	VARCHAR2(1 BYTE) O
	private String boardDeclaration; //	BOARD_DECLARATION	VARCHAR2(1 BYTE) O
	private int BoardRatting; //	BOARD_RATIING	NUMBER O
	private String sellWay; //	SELL_WAY	NUMBER O
	private String tag19Product; //	TAG_19_PRODUCT	VARCHAR2(1 BYTE) O
	private Date createDate; //	CREATE_DATE	DATE O
	private Date modifyDate; //	CREATE_DATE	DATE O
	private String buyerId; //	BUYER_ID	VARCHAR2(15 BYTE) O
	private String afterBuyReply; //	AFTER_BUY_REPLY	VARCHAR2(1000 BYTE) O
	private String titleImg; // 대표 이미지 O
	private String preferPayment; // 선호 결제 방식 O
	
	private int sellCount;
	private	int buyCount;
	private int replyCount;
}
