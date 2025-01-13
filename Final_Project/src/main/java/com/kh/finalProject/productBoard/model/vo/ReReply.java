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
public class ReReply {

	private int reReplyNo; //	REREPLY_NO	NUMBER
	private int replyNo; //	REPLY_NO	NUMBER
	private String reReplyWriter; //	REREPLY_WRITER	VARCHAR2(15 BYTE)
	private String reReplyContent; //	REREPLY_CONTENT	VARCHAR2(1000 BYTE)
	private Date reReplyDate; //	REREPLY_DATE	DATE
	private String reReplyDeclaration;
}
