package com.kh.finalProject.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class BoardCategory {

	private int boardCateNo; //	BOARDCATE_NO	NUMBER
	private String boardCateName; //	BOARDCATE_NAME	VARCHAR2(1000 BYTE)
	
}
