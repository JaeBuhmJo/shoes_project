package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.project.domain.MessageDTO;
import com.project.service.ChatRoomService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {
	private final SimpMessagingTemplate template;
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@MessageMapping("/chat/enter")
	public void enter(MessageDTO message) {
		message.setContent(message.getMemberId() + "님 환영합니다. 무엇을 도와드릴까요?");
		message.setMessageType("SYSTEM");
		template.convertAndSend("/sub/chat/room/"+message.getChatRoomId(), message);
	}
	
	@MessageMapping("/chat/message")
	public void message(MessageDTO message) {
		chatRoomService.updateLastActiveTime(message.getChatRoomId());
		message.setMessageType("NORMAL");
		template.convertAndSend("/sub/chat/room/"+message.getChatRoomId(), message);
	}
	
	@MessageMapping("/chat/leave")
	public void leave(MessageDTO message) {
		message.setContent(message.getMemberId() + "님이 상담을 종료하셨습니다.");
		message.setMessageType("SYSTEM");
		template.convertAndSend("/sub/chat/room/"+message.getChatRoomId(), message);
	}
	 
}
    