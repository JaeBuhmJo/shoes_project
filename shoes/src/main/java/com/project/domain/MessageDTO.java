package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MessageDTO {
	private String messageId;
	private String chatRoomId;
	private String memberId;
	private String messageType;
	private String content;
	private Date timestamp;
	
}
