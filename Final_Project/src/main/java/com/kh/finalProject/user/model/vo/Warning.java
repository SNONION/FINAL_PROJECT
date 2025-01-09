package com.kh.finalProject.user.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class Warning {

	private String userId; //	USER_ID	VARCHAR2(15 BYTE)
	private Date warningDate; //	WARNNING_DATE	DATE
	private String declarationId; //	DECLARATION_ID	VARCHAR2(15 BYTE)
	private String declarationContent; //	DECLARATION_CONTENT	VARCHAR2(1000 BYTE)
	
}
