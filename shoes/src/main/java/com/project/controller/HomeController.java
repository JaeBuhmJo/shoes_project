package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.MemberDTO;
import com.project.service.MemberService;
import com.project.service.MemberServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@Autowired
	private MemberService service;

	@GetMapping("/")
	public String home() {
		log.info("welcome shop!");
		return "index";
	}

	@GetMapping("/auth")
	@ResponseBody
	public Authentication authen() {

		return SecurityContextHolder.getContext().getAuthentication();
	}

	@GetMapping("/main")
	public void contactGet() {

	}

	
//  없어도 화면 나옴
//	@GetMapping("/nonloginmodify") 
//	public void nonloginmodifyGet() {
//	log.info("비밀번호 찾기 페이지 요청"); 
//	}
	
	 
	// 비로그인 비밀번호 변경
	@PostMapping("/nonloginmodify")
	public String changePasswordPost(MemberDTO memberDTO, HttpSession session) {
		log.info("비로그인 비밀번호 수정 요청 " + memberDTO);

		// 비밀번호 변경
		if (service.changePassword(memberDTO)) {
			session.invalidate();
			return "redirect:/member/login";
		}

		return "redirect:/nonloginmodify";
	}

}
