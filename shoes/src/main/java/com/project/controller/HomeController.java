package com.project.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		log.info("Welcome shop!");
		return "index";
	}
	
	
	@GetMapping("/auth")
	@ResponseBody
	public Authentication authen() {
		
		return SecurityContextHolder.getContext().getAuthentication();
	}
	
	@GetMapping("member/contact")
	public void contactGet() {
		
	}
}
