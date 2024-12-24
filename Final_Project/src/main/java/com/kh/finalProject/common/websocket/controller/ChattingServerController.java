package com.kh.finalProject.common.websocket.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/chatting")
public class ChattingServerController {

	@ResponseBody
	@RequestMapping(value="saveChatUser", produces="html/text;charset=UTF-8")
	public String saveChatUser(String otherUser, HttpServletRequest request) {
		
		// 세션에 등록
		request.getSession().setAttribute("otherUser", otherUser);
		
		return "NNNNY";
		
	}
	
	@ResponseBody
	@RequestMapping(value="deleteChatUser", produces="html/text;charset=UTF-8")
	public String deleteChatUser(HttpServletRequest request) {
		
		// 세션에서 제거
		request.getSession().removeAttribute("otherUser");
		
		return "NNNNY";
		
	}
	
}
