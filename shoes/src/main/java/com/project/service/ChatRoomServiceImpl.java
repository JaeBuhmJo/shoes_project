package com.project.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import com.project.domain.ChatRoomDTO;
import com.project.mapper.ChatRoomMapper;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {

	@Autowired
	private ChatRoomMapper chatRoomMapper;

	@Override
	public List<ChatRoomDTO> getChatRoomList(String memberId, Authentication authentication) {
		boolean isAdmin = false;
		for (GrantedAuthority authority : authentication.getAuthorities()) {
			if (authority.getAuthority().equals("ROLE_ADMIN")) {
				isAdmin = true;
				break;
			}
		}
		return isAdmin ? chatRoomMapper.selectChatRoomList() : chatRoomMapper.selectChatRoomListByMemberId(memberId);
	}

	@Override
	public boolean updateLastActiveTime(String chatRoomId) {
		return chatRoomMapper.updateChatRoom(chatRoomId) == 1 ? true : false;
	}

	@Override
	public String openChatRoom(String memberId) {
		ChatRoomDTO chatRoomDTO = new ChatRoomDTO();
		String chatRoomId = UUID.randomUUID().toString();
		chatRoomDTO.setChatRoomId(chatRoomId);
		chatRoomDTO.setMemberId(memberId);
		return chatRoomMapper.insertChatroom(chatRoomDTO) == 1 ? chatRoomId : "";
	}

}
