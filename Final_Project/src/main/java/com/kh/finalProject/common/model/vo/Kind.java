package com.kh.finalProject.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Kind {

	private int kindNo; //	KIND_NO	NUMBER
	private String kindName; //	KIND_NAME	VARCHAR2(1000 BYTE)
	
}
