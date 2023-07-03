package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoomDTO {
	private String chatRoomId;
	private String memberId;
	private String lastActiveTime;
	private String recentMessage;
}
