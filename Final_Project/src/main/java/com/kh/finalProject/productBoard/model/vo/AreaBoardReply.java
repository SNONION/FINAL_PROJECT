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
public class AreaBoardReply {

	private int boardReplyNo; //	REPLY_NO	NUMBER
	private String boardReplyContent; //	REPLY_CONTENT	VARCHAR2(4000 BYTE)
	private Date createDate; //	CREATE_DATE	DATE
	private int refBno; //	REF_BNO	NUMBER
	private String replyDeclaration; //	REPLY_DECLARATION	VARCHAR2(1 BYTE)
	private String boardReplyWriter; //	REPLY_WRITER	VARCHAR2(15 BYTE)
	
}
