package com.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.ChatRoomDTO;
import com.project.service.ChatRoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/chatrooms")
public class ChatRoomsController {

	@Autowired
	private ChatRoomService chatRoomService;

	@GetMapping("/")
	public ResponseEntity<List<ChatRoomDTO>> getRooms(Principal principal, Authentication authentication) {
		log.info("실시간 상담 목록 요청");
		List<ChatRoomDTO> chatRoomList = chatRoomService.getChatRoomList(principal.getName(), authentication);
		return new ResponseEntity<List<ChatRoomDTO>>(chatRoomList, HttpStatus.OK);
	} 

	@PutMapping("/room")
	public ResponseEntity<String> createRoom(Principal principal) {
		log.info("실시간 상담 생성 요청" + principal.getName());
		return new ResponseEntity<String>(chatRoomService.openChatRoom(principal.getName()), HttpStatus.OK);
	}
}
