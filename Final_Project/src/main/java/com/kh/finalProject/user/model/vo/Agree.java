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
public class Agree {

	private String userId;
	private String privateInfoAgreee;
	private String serviceUseAgree;
	private String marketingAgree;
	private Date AgreeDate;
	
}
