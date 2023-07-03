package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.CartDTO;
import com.project.domain.MemberDTO;
import com.project.domain.OrderDTO;
import com.project.domain.OrderPageDTO;
import com.project.service.CartService;
import com.project.service.MemberService;
import com.project.service.OrderService;



@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	private CartService cartService;
	
	
	 @Autowired
	    public OrderController(OrderService orderService, CartService cartService) {
	        this.orderService = orderService;
	        this.cartService = cartService;
	    }

	    @PostMapping("/placeOrder")
	    public String placeOrder(@RequestParam("cartIds") String cartIds,
	                             @RequestParam("memberId") String memberId,
	                             @RequestParam("orderName") String orderName,
	                             @RequestParam("orderAddress") String orderAddress,
	                             @RequestParam("orderPhone") String orderPhone,
	                             @RequestParam("orderPayment") String orderPayment) {
	        // 장바구니 항목검색
	        List<CartDTO> cartItems = cartService.getCartList(cartIds);
	        
	        // 주문
	        orderService.placeOrder(cartItems, memberId, orderName, orderAddress, orderPhone, orderPayment);
	        
	        // 주문 확인 페이지로 
	        return "redirect:/order";
	    }
	}
	
	
	
	
/*	@PostMapping("/order")
	public String orderPagePost(OrderDTO od, HttpServletRequest request) {
		
		System.out.println(od);		
		
		orderService.order(od);
		
		MemberDTO member = new MemberDTO();
		member.setMemberId(od.getMemberId());
				
		return "redirect:/main";
	}	
	
}*/
	
	
	
	

    

