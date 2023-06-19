package com.project.domain.detail;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {

	private String memberId;
	private String name;
	private String password;
	private String phone;
	private String address;
	private String email;
	private String authority;
	private String footSize;
	private Date registerDate;
	

	//cart 랑 연결?
	private CartDTO memberCart;
	
	
	
	
}
