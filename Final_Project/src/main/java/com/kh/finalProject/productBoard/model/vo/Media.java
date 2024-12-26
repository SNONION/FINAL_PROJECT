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
public class Media {

private int mediaNo; //	MEDIA_NO	NUMBER
private int refBno; //	REF_BNO	NUMBER
private String originName; //	ORIGIN_NAME	VARCHAR2(1000 BYTE)
private String changeName; //	CHANGE_NAME	VARCHAR2(1000 BYTE)
private String mediaPath; //	MEDIA_PATH	VARCHAR2(1000 BYTE)
private Date uploadDate; //	UPLOAD_DATE	DATE
	
}
