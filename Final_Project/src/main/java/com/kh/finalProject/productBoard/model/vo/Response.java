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
public class Response {

private int responseNo; //	RESPONSE_NO	NUMBER
private int requestNo; //	REQUEST_NO	NUMBER
private String responseWriter; //	RESPONSE_WRITER	VARCHAR2(15 BYTE)
private String responseContent; //	RESPONSE_CONTENT	VARCHAR2(4000 BYTE)
private Date responseDate; //	RESPONSE_DATE	DATE
	
}
