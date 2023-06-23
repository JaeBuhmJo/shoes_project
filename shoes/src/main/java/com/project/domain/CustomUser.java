package com.project.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.javassist.expr.NewArray;
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
		
		
	}
	
	public CustomUser(MemberDTO memberDTO) {
		super(memberDTO.getMemberId(),memberDTO.getPassword(),Arrays.asList(new SimpleGrantedAuthority(memberDTO.getAuthority())));
		this.memberDTO = memberDTO;
	}	
	
}
