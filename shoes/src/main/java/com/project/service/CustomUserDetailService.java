package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


import com.project.domain.CustomUser;
import com.project.domain.MemberDTO;
import com.project.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;


//@Service("detail")
@Slf4j
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		
		log.info("memberId "+ memberId);	
		
	    MemberDTO memberDTO = mapper.login(memberId);		
		
		return new CustomUser(memberDTO);	   
	}
}
