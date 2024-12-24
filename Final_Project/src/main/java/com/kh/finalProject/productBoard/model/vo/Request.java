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
public class Request {

	private int requestNo; //	REQUEST_NO	NUMBER
	private String requestWriter; //	REQUEST_WRITER	VARCHAR2(15 BYTE)
	private String requestTitle; //	REQUEST_TITLE	VARCHAR2(1000 BYTE)
	private String requestContent; //	REQUEST_CONTENT	VARCHAR2(4000 BYTE)
	private Date requestDate; //	REQUEST_DATE	DATE
	private String lockStatus; // 비밀글 상태
		
}
