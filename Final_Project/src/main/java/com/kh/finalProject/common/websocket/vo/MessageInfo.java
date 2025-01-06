package com.kh.finalProject.common.websocket.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data

// 직렬화가 가능하도록 해당 클래스에 Serializable 인터페이스를 구현
public class MessageInfo implements Serializable {
	
	// 직렬화가 가능하도록 설정
	private static final long serialVersionUID = 5459545894286175382L;
	private String nickname;
	private String messageContent;
	private String createData;
	
}
