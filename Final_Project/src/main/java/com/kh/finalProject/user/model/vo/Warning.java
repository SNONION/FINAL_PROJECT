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
	private String userId; //신고자 
	private Date warningDate; //경고 날짜
	private String declarationId; //피신고자
	private String declarationContent; //신고사유작성
}
