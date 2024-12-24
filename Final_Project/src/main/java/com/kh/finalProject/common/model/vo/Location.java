package com.kh.finalProject.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Location {

private	int locationNo; //	LOCATION_NO	NUMBER
private String locationName; //	LOCATION_NAME	VARCHAR2(1000 BYTE)
private String locationDetail1; //	LOCATION_DETAIL_1	VARCHAR2(500 BYTE)
private String locationDetail2; //	LOCATION_DETAIL_2	VARCHAR2(500 BYTE)
	
}
