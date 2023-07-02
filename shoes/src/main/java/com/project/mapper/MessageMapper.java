package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.MessageDTO;

@Mapper
public interface MessageMapper {
	public int insertMessage(MessageDTO messageDTO);
	public List<MessageDTO> selectMessages(String chatRoomId);
}
