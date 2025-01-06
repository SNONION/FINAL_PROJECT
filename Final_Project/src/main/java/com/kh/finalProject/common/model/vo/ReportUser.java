package com.kh.finalProject.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ReportUser {

	private String userId; // 신고자 아이디
	private Date reportDate; // 신고한 날짜
	private String declarationId; // 피신고자 아이디
	
}
