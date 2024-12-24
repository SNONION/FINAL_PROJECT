package com.kh.finalProject.common.template;

import com.kh.finalProject.common.model.vo.PageInfo;

public class PageNation{

	// 페이징 처리용
	public static PageInfo pageNation(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil(((double)listCount/boardLimit));
		
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// 시작 페이지로부터 몇개를 보여줄지에 따라 처리됨
		int endPage = (startPage + pageLimit) - 1;
		
		// 마지막 페이지가 최대 페이지보다 작은 경우 최대 페이지를 마지막 페이지로 설정
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 처리된 정보 데이터 담아주기
		PageInfo pageInfo = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 페이지 정보 반환
		return pageInfo;
	}
}
