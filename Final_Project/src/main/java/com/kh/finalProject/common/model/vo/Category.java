package com.kh.finalProject.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Category {

	private int categoryNo; //	CATEGORY_NO	NUMBER
	private String categoryName;//	CATEGORY_NAME	VARCHAR2(1000 BYTE)
	private String categoryDetailName;//	CATEGORY_DETAIL_NAME	VARCHAR2(1000 BYTE)
	
}
