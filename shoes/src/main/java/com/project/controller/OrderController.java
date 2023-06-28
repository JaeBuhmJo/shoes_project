package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.domain.MemberDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderPageDTO;
import com.project.service.MemberService;
import com.project.service.OrderService;



@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	private MemberService memberService;
	
	@GetMapping("/order/{memberId}")
	public String orderPgaeGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {
		
		model.addAttribute("orderList", orderService.getOrderlist(opd.getOrders()));
		model.addAttribute("memberInfo", memberService.equals(memberId));
		
		
		return "/order";
	}
	
	@PostMapping("/order")
	public String orderPagePost(OrderDTO od, HttpServletRequest request) {
		
		System.out.println(od);		
		
		orderService.order(od);
		
		MemberDTO member = new MemberDTO();
		member.setMemberId(od.getMemberId());
		
		
		return "redirect:/main";
	}	
	
}
	
	
	
	

    

