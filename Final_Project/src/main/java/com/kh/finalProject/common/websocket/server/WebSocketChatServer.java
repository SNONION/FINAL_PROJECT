package com.kh.finalProject.common.websocket.server;

import java.io.File;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.text.Collator;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.finalProject.common.model.vo.ChatInfo;
import com.kh.finalProject.common.template.AppendObjectOutputStream;
import com.kh.finalProject.common.websocket.vo.MessageInfo;
import com.kh.finalProject.productBoard.model.service.ProductBoardService;
import com.kh.finalProject.user.model.vo.User;

public class WebSocketChatServer extends TextWebSocketHandler{
	
	// 특정 대상에게만 채팅하는 서버를 구현 (동기화 처리 Collections.synchronizedMap(맵));
	private Map<String, WebSocketSession> users = Collections.synchronizedMap(new HashMap<>());
	
	@Autowired
	private ProductBoardService productBoardService;
	
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
		String date = new SimpleDateFormat("HH:mm").format(new Date());
		
		MessageInfo msgInfo = MessageInfo.builder().nickname(nickname).messageContent(msg).createData(date).build();
		
		// 보내는 사람과 받는 사람이 다른 경우에만 저장
		if(!nickname.equals(otherUser) || !otherUser.equals("")) {
			// 파일명을 동일하게 만들기 위해 알파벳 순으로 정렬한 배열을 사용
			String[] usersChat = {nickname, otherUser};
			Collator collator = Collator.getInstance(Locale.KOREAN);
			Arrays.sort(usersChat, collator);
	
			// 파일 생성 전 파일 경로가 존재하는지 확인 없다면 생성
			File dir = new File("D:\\chatRecords");
			
			if (!dir.exists()) {
			    dir.mkdirs(); 
			}
			
			// 먼저 중복 생성을 방지하기 위해 해당 파일이 존재하는 유무 확인
			File file = new File("D:\\chatRecords\\" + usersChat[0] + "-" + usersChat[1] + ".txt");
			
			// 객체 단위로 파일에 저장하기 위해 ObjectOutputStream 사용
			ObjectOutputStream msgSaveFile = null;
			
			// 파일이 존재할 경우 파일을 해당 파일에 계속해서 메시지를 객체형태로 저장한다.
			if(file.exists() && file.isFile()) {
				
				// 파일 이어쓰기 설정
				FileOutputStream fos = new FileOutputStream(file, true);
				
				// ObjectOutputStream는 이어쓰기가 불가능 (헤더를 추가해주기 때문에) 따라서 헤더를 붙이지 않도록 설정
				msgSaveFile = new AppendObjectOutputStream(fos);
			}
			// 파일이 존재하지 않을 경우 파일을 생성하고 메시지를 객체형태로 저장한다.
			else {
				
				// 파일 덮어쓰기 설정 (헤더가 추가된다)
				FileOutputStream fos = new FileOutputStream(file, true);
							
				msgSaveFile = new ObjectOutputStream(fos);	
			}
			
			// 객체를 직렬화해 파일에 저장
			msgSaveFile.writeObject(msgInfo);
			
			// DB에 저장을 위해 객체로 넣어 넘겨준다.
			ChatInfo chatInfo = ChatInfo.builder().sellerId(otherUser).buyerId(nickname).fileFullName("D:\\chatRecords\\" + file.getName()).build();
			
			// 작성 후 해당 파일을 DB에 저장 (중복 방지 처리 후)
			int count = productBoardService.checkChatDul(chatInfo);
			
			// count가 0이 아닐 경우 즉, 파일이 없을 경우 DB에 정보 저장
			if(count == 0) {
				productBoardService.insertChatInfo(chatInfo);
			}
			
			// 자원 반납
			msgSaveFile.flush();
			msgSaveFile.close();
		}
		
		msg = new Gson().toJson(msgInfo);
		
		// 내가 보낸 메세지를 내 세션에서도 보여주는 과정
		WebSocketSession mySession = users.get(nickname);
		mySession.sendMessage(new TextMessage(msg));
		
		if(users.containsKey(otherUser)) {
			// 수신 받는 유저의 이름을 key값으로 value인 session정보를 찾는 과정
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
