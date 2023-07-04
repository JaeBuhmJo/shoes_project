package com.project.service;

import java.util.List;

import com.project.domain.MessageDTO;

public interface MessageService {
	public boolean saveMessage(MessageDTO messageDTO);
	public List<MessageDTO> getMessages(String chatRoomId);
}
