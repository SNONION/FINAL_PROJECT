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
public class AreaBoard {

	private int areaNo; //	AREAB_NO	NUMBER
	private int locationNo; //	LOCATION_NO	NUMBER
	private int boardCateNo; //	BOARDCATE_NO	NUMBER
	private String areaTitle; //	AREAB_TITLE	VARCHAR2(1000 BYTE)
	private String areaContent; //	AREAB_CONTENT	VARCHAR2(4000 BYTE)
	private int count; //	COUNT	NUMBER
	private String areaWriter; //	AREAB_WRITER	VARCHAR2(15 BYTE)
	private Date createDate; //	CREATE_DATE	DATE
	private String areaDeclaration; //	AREAB_DECLARATION	VARCHAR2(1 BYTE)
	
	private String locationName; //	LOCATION_NAME
	private String boardCateName; // BOARDCATE_NAME
	
}
