package com.project.controller.header;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping("/shoes")
public class ShoesController {

	
	@GetMapping("/sale")
	public void saleGet() {
		log.info("sale 화면");

	}
	@GetMapping("/detail")
	public void detailGet() {
		log.info("detail 화면");

	}
}
