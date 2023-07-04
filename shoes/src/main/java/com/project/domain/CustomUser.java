package com.project.domain;

import java.util.Arrays;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class CustomUser extends User {

	private MemberDTO memberDTO;	

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// 이 생성자는 username, password 및 authorities를 매개변수로 받아서 부모 클래스인 User의 생성자를 호출합니다.
		// 즉, 이 생성자는 사용자의 이름, 비밀번호 및 권한 정보를 전달하여 User 객체를 생성하는 역할
		
	}
	
	public CustomUser(MemberDTO memberDTO) {
		super(memberDTO.getMemberId(),memberDTO.getPassword(),Arrays.asList(new SimpleGrantedAuthority(memberDTO.getAuthority())));
		this.memberDTO = memberDTO;
		// MemberDTO 객체를 매개변수로 받아서 부모 클래스인 User의 생성자를 호출하고, 동시에 memberDTO 멤버 변수를 설정합니다.
		// MemberDTO 객체로부터 멤버 ID, 비밀번호 및 권한 정보를 가져와서 User 객체를 생성하고, 이를 통해 CustomUser 객체를 생성
		
	}	
	
}
// CustomUser 클래스는 User 클래스를 확장하고, 사용자의 정보와 MemberDTO 객체를 추가로 가지는 사용자 정의 클래스입니다.
// 이 클래스를 사용하여 사용자의 인증 및 권한 정보를 포함한 커스텀 사용자 객체를 생성