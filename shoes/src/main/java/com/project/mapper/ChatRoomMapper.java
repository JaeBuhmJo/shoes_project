package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.domain.ChatRoomDTO;

@Mapper
public interface ChatRoomMapper {
	public int insertChatroom(ChatRoomDTO chatRoomDTO);
	public List<ChatRoomDTO> selectChatRoomListByMemberId(String memberId);
	public List<ChatRoomDTO> selectChatRoomList();
	public int updateChatRoom(String chatRoomId);
	public String getMemberId(String chatRoomId);
}
