package com.project.service;

import java.util.List;

import org.springframework.security.core.Authentication;

import com.project.domain.ChatRoomDTO;
import com.project.domain.MessageDTO;

public interface ChatRoomService {
	public String openChatRoom(String memberId);
	public List<ChatRoomDTO> getChatRoomList(String memberId, Authentication authentication);
	public boolean updateChatRoom(MessageDTO messageDTO);
}
