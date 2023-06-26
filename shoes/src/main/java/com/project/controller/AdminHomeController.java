package com.project.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminHomeController {
	@GetMapping("/index")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public void indexGet() {
		log.info("어드민 인덱스 요청");
	}
}
