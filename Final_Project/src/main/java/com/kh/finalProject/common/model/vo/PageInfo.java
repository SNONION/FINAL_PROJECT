package com.kh.finalProject.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class PageInfo {

	// 임의로 변경하지 말것!!
	private int listCount; // 게시물 총 개수
	private int currentPage; // 현재 페이지 번호
	private int pageLimit; // 한번에 보여줄 최대 페이지 갯수
	private int listLimit; // 한번에 보여줄 최대 게시물 갯수
	
	private int maxPage; // 최대 페이지
	private int startPage;
	private int endPage;
	
}