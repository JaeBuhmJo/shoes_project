package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.domain.MemberDTO;
import com.project.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private BCryptPasswordEncoder bPasswordEncoder;

	// 회원 가입
	@Override
	public boolean register(MemberDTO memberDTO) {

		// 비밀번호 암호화
		memberDTO.setPassword(bPasswordEncoder.encode(memberDTO.getPassword()));
		// 권한 설정

		return mapper.register(memberDTO) == 1 ? true : false;
	}

	// 회원 수정
	@Override
	public boolean update(MemberDTO memberDTO) {

		// 암호화된 비밀번호 DB가져오기
		String encodePass = mapper.getPass(memberDTO.getMemberId());

		// 변경 비빌번호 암호화
		memberDTO.setNewPassword(bPasswordEncoder.encode(memberDTO.getNewPassword()));
		return mapper.update(memberDTO) == 1 ? true : false;

	}

	// 회원 탈퇴
	@Override
	public boolean remove(MemberDTO memberDTO) {

		// 비밀번호 확인
		String encodePass = mapper.getPass(memberDTO.getMemberId());

		if (bPasswordEncoder.matches(memberDTO.getPassword(), encodePass)) {
			return mapper.remove(memberDTO.getMemberId()) == 1 ? true : false;
		} else {
			return false;
		}

	}

	// 중복아이디
	@Override
	public boolean dupid(String memberId) {
		return mapper.dupid(memberId) == 1 ? true : false;
	}

	// 로그인 못한 회원 비밀번호 변경
	@Override
	public boolean changePassword(MemberDTO memberDTO) {
		
		// 변경 비빌번호 암호화
		memberDTO.setNewPassword(bPasswordEncoder.encode(memberDTO.getNewPassword()));
		return mapper.changePassword(memberDTO) == 1 ? true : false;
	}

}
