package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.MessageDTO;
import com.project.mapper.MessageMapper;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper messageMapper;
	
	@Override
	public boolean saveMessage(MessageDTO messageDTO) {
		String content = messageDTO.getContent();
		content = content.replace("\n", "<br>");
		messageDTO.setContent(content);
		return messageMapper.insertMessage(messageDTO)==1?true:false;
	}

	@Override
	public List<MessageDTO> getMessages(String chatRoomId) {
		return messageMapper.selectMessages(chatRoomId);
	}

}
