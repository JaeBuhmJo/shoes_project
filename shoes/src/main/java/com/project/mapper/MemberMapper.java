package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;


import com.project.domain.LoginDTO;
import com.project.domain.MemberDTO;

@Mapper
public interface MemberMapper {
	// 회원가입
	public int register (MemberDTO memberDTO);
	// 암호화 비밀번호 가져오기
	public String getPass(String memberId);
	// 로그인 
	public MemberDTO login(String memberId);
	// 회원수정
	public int update (MemberDTO memberDTO);
	// 회원탈퇴
	public int remove (String memberId);
	// 중복아이디
	public int dupid (String memberId);
	// 로그인 못한 유저 비밀번호 변경
	public int changePassword (MemberDTO memberDTO);
}
