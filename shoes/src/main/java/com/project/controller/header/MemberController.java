package com.project.controller.header;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {

	@GetMapping("/cart")
	public void cartGet() {
		log.info("cart 화면");

	}
	@GetMapping("/info")
	public void infoGet() {
		log.info("info 화면");

	}
	@GetMapping("/qna")
	public void qnaGet() {
		log.info("qna 화면");

	}
	@GetMapping("/register")
	public void registerGet() {
		log.info("register 화면");

	}
}
