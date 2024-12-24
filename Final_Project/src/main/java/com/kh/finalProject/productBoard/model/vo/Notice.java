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
public class Notice {

	private int noticeNo; //	NOTICE_NO	NUMBER
	private String noticeTitle; //	NOTICE_TITLE	VARCHAR2(1000 BYTE)
	private String noticeWriter; //	NOTICE_WRITER	VARCHAR2(15 BYTE)
	private String noticeContent; //	NOTICE_CONTENT	VARCHAR2(4000 BYTE)
	private Date createDate; //	CREATE_DATE	DATE
	private Date modifyDate; //	MODIFY_DATE	DATE
	private int count; // 조회수
	
}
