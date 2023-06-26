package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDTO {

	private String memberId;
	private String name;
	private String password;
	private String newPassword;
	private String confirmPassword;
	private String phone;
	private String address;
	private String email;
	private String authority;
	private int footSize;
	private Date registerDate;	
	
	public boolean passwordEquals() {
		return newPassword.equals(confirmPassword);
	}

}
