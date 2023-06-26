package com.project.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDTO {
	private String memberId;
	private String Name;
	private String Email;
	private String Address;
	private String Phone;
	private int Authority;
}
