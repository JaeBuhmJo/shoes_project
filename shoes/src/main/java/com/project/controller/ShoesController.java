package com.project.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.ProductDTO;
import com.project.service.DetailService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping("/shoes")
public class ShoesController {

	@Autowired
	private DetailService service;
	
	@GetMapping("/sale")
	public void saleGet() {
		log.info("sale 화면");

	}
	@GetMapping("/detail")
	public void detailRead(Model model, int productId) {
		log.info("detail 화면");

		//model 은 jsp에서 여기선 product.productId,product.price등의 값들을 주기 위해 사용
		model.addAttribute("product", service.detail(productId));

	}

	
	
	
	
	
}
