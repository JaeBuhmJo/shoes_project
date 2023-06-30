package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.MemberDTO;
import com.project.domain.OrderPageDTO;
import com.project.domain.OrderProductDTO;
import com.project.service.MemberService;
import com.project.service.OrderService;
import com.project.service.PurchaseService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("")
public class PurchaseController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	
	// 주문페이지 get
	
	@RequestMapping(value= "/Purchase", method = RequestMethod.GET)
	public String getPurchase(HttpSession session, String update, MemberDTO member, Model model, OrderProductDTO opd)
	      throws Exception {
		log.info("get Purchase페이지");
		// 주문 주회 리스트
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		List<OrderProductDTO> getOrderList = orderService.orderList(memberDTO.getMemberId());
		
		model.addAttribute("getOrderList", getOrderList);
		
		 
		return "/Purchase";
	}
	
}
