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

	private int boardNo; //	BOARD_NO	NUMBER
	private String boardWriter; //	BOARD_WRITER	VARCHAR2(15 BYTE)
	private int categoryNo; //	CATEGORY_NO	NUMBER
	private int locationNo;//	LOCATION_NO	NUMBER
	private String sellLocation; //	SELL_LOCATION	VARCHAR2(500 BYTE)
	private int kindNo; //	KIND_NO	NUMBER
	private String productStatus; //	PRODUCT_STATUS	VARCHAR2(10 BYTE)
	private String boardTitle; //	BOARD_TITLE	VARCHAR2(1000 BYTE)
	private String BoardContent; //	BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private int price;//	PRICE	NUMBER
	private int count; //	COUNT	NUMBER
	private String tradeSellStatus; //	TRADE_SELL_STATUS	VARCHAR2(1 BYTE)
	private String tradeBuyStatus; //	TRADE_BUY_STATUS	VARCHAR2(1 BYTE)
	private String boardDeclaration; //	BOARD_DECLARATION	VARCHAR2(1 BYTE)
	private int BoardRatting; //	BOARD_RATIING	NUMBER
	private int sellWay; //	SELL_WAY	NUMBER
	private String tag19Product; //	TAG_19_PRODUCT	VARCHAR2(1 BYTE)
	private Date createDAte; //	CREATE_DATE	DATE
	private Date modifyDAte; //	CREATE_DATE	DATE
	private String buyerId; //	BUYER_ID	VARCHAR2(15 BYTE)
	private String afterBuyReply; //	AFTER_BUY_REPLY	VARCHAR2(1000 BYTE)
	private String titleImg; // 대표 이미지
	
	private int sellCount;
	private	int buyCount;
	private int replyCount;
}
