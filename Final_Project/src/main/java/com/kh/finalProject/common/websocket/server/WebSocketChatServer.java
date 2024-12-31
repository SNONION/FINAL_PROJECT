package com.kh.finalProject.common.websocket.server;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.finalProject.common.websocket.vo.MessageInfo;
import com.kh.finalProject.user.model.vo.User;

public class WebSocketChatServer extends TextWebSocketHandler{
	
	// 특정 대상에게만 채팅하는 서버를 구현 (동기화 처리 Collections.synchronizedMap(맵));
	private Map<String, WebSocketSession> users = Collections.synchronizedMap(new HashMap<>());
	
	// 접속
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		User loginUser = (User)session.getAttributes().get("loginUser");
		
		users.put(loginUser.getNickname(), session);
		
	}
	
	// 수신
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 메시지를 보내며 외부 파일에 바로 저장되는 방식으로 진행
		JsonObject jsonObj = JsonParser.parseString(message.getPayload()).getAsJsonObject();
		String nickname = jsonObj.get("nickname").getAsString();
		String otherUser = jsonObj.get("otherUser").getAsString();
		String msg = jsonObj.get("msg").getAsString();
		String date = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(new Date());
		
		MessageInfo msgInfo = MessageInfo.builder().nickname(nickname).messageContent(msg).createData(date).build();
		
		msg = new Gson().toJson(msgInfo);
		
		// 내가 보낸 메세지를 내 세션에서도 보여주는 과정
		WebSocketSession mySession = users.get(nickname);
		mySession.sendMessage(new TextMessage(msg));
		
		if(users.containsKey(otherUser)) {
	
			// 수신 받는 유저의 이름을 key값으로 value인 session정보를 찾는 과정 -> 이미 저장된 세션을 가져오는 것임
			WebSocketSession adminSession = users.get(otherUser);
			adminSession.sendMessage(new TextMessage(msg));
		}
	}
	
	// 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		User loginUser = (User)session.getAttributes().get("loginUser");
		
		users.remove(loginUser.getNickname());
		
	}
}
