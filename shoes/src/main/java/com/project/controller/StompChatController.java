package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.MessageDTO;
import com.project.service.ChatRoomService;
import com.project.service.MessageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {
	private final SimpMessagingTemplate template;
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@Autowired
	private MessageService messageService;
	
	@Transactional
	@MessageMapping("/chat/enter")
	public void enter(MessageDTO messageDTO) {
		messageDTO.setContent(messageDTO.getMemberId() + "님이 실시간 상담에 입장했습니다.");
		messageDTO.setMessageType("SYSTEM");
		saveAndSend(messageDTO);
	}
	
	@Transactional
	@MessageMapping("/chat/message")
	public void message(MessageDTO messageDTO) {
		chatRoomService.updateLastActiveTime(messageDTO.getChatRoomId());
		messageDTO.setMessageType("NORMAL");
		saveAndSend(messageDTO);
	}
	
	@Transactional
	@MessageMapping("/chat/leave")
	public void leave(MessageDTO messageDTO) {
		messageDTO.setContent(messageDTO.getMemberId() + "님이 상담을 종료하셨습니다.");
		messageDTO.setMessageType("SYSTEM");
		saveAndSend(messageDTO);
	}
	
	public void saveAndSend(MessageDTO messageDTO) {
		messageService.saveMessage(messageDTO);
		template.convertAndSend("/sub/chat/room/"+messageDTO.getChatRoomId(), messageDTO);
	}
	 
}
    