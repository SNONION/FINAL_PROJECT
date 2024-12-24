package com.kh.finalProject.common.websocket.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MessageInfo {

	private String nickname;
	private String messageContent;
	private String createData;
	
}
