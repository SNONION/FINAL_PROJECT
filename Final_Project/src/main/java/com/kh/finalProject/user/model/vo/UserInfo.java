package com.kh.finalProject.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class UserInfo {

	private int sellCount; // 판매 횟수
	private int buyCount; // 구매 횟수
	private int replyCount; // 거래후기 작성 횟수
	
	private String trustImg; // 신뢰도 등급 이미지
	private String gradeContent; // 신뢰도 설명
}
