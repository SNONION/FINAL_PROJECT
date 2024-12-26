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
public class ProductInfo {
	
	private int boardNo; //	BOARD_NO	NUMBER
	private String productName; //	PRODUCT_NAME	VARCHAR2(1000 BYTE)
	private String createLocation; //	CREATE_LOCATION	VARCHAR2(1000 BYTE)
	private Date PurchaseDate; //	PURCHASE_DATE	DATE

}
