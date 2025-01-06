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
public class Reply {

	private int replyNo; //	REPLY_NO	NUMBER
	private String replyWriter; //	REPLY_WRITER	VARCHAR2(15 BYTE)
	private int refBno; //	REF_BNO	NUMBER
	private String replyContent; //	REPLT_CONTENT	VARCHAR2(4000 BYTE)
	private Date replyDate; //	REPLY_DATE	DATE
	private String replyDeclaration; //	REPLY_DECLARATION	VARCHAR2(1 BYTE)
	
}
