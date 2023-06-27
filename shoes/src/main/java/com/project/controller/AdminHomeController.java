package com.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.Criteria;
import com.project.service.ProductService;
import com.project.service.PurchaseService;
import com.project.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminHomeController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/index")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public void indexGet(Model model) {
		log.info("어드민 인덱스 요청");
		Map<String, Integer> adminMap = new HashMap<>();
		Criteria cri = new Criteria();
		//판매중인 상품 건수
		adminMap.put("onSaleCount", productService.getSaleCount(cri));
		//판매 중단 상품 건수
		adminMap.put("offSaleCount", productService.getOffCount());
		//전날 주문 건수
		adminMap.put("orderCount", purchaseService.getOrderCount());
		//전날 주문 금액
		adminMap.put("orderAmount", purchaseService.getOrderAmount());
		//전날 주문 고객 수
		adminMap.put("orderedCustomer", purchaseService.getOrderedCustomerCount());
		//답변 미등록 문의 수
		adminMap.put("getNoAnswerqnas", qnaService.getNoAnswerqnas());
		//총 회원 수
		
		//방문자 수
		
		//누적 방문자 수
		
		model.addAttribute("adminMap",adminMap);
		model.addAttribute("productList",productService.getAllProducts(new Criteria()));
	}
}
