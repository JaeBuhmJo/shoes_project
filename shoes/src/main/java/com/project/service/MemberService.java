package com.project.service;

import java.lang.reflect.Member;


import com.project.domain.LoginDTO;
import com.project.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입
	public boolean register(MemberDTO memberDTO);
	// 회원수정
	public boolean update(MemberDTO memberDTO);
	// 회원탈퇴
	public boolean remove(MemberDTO memberDTO);
	// 중복아이디
	public boolean dupid(String memberId);
	// 비밀번호 수정 
	public boolean changePassword(MemberDTO memberDTO);
}
