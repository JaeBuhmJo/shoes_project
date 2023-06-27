package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.CartDTO;
import com.project.domain.MemberDTO;
import com.project.service.CartService;

@RequestMapping("/cart")
@Controller
public class CartController {
	
	
	
	@Autowired
	private CartService cartService;
	
	// 장바구니 추가 기능
	
	// (1)등록실패
	// (2)등록성공
	// (3)등록된 데이터 존재
	// (4)로그인필요
	
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPost(CartDTO cart, HttpServletRequest request) {
		// 먼저 로그인 여부를 체크하고 로그인되지 않았을 경우 5를 반환하도록 코드를 추가
		HttpSession session = request.getSession();
		MemberDTO memberDto = (MemberDTO)session.getAttribute("member");
		if(memberDto == null) {
			return "5";		
		}
		
		// 장바구니 등록
		
		int result = cartService.addCart(cart);
				
		return result + "";

  }
	
     // 장바구니 페이지 이동

     @GetMapping("/cart")
     public String cartPageGet(HttpServletRequest request,String cart) {
    	 System.out.println(request.getSession().getAttribute("member"));
    	 
      return "/cart";
      
     }
    	 
     // 장바구니 담은 수량 수정
    	 
     @PostMapping("/cart/update") 	 
     public String updateCartPost(CartDTO cart) {
    	 cartService.modifyamount(cart);
    	 return "redirect:/cart/" + cart.getMemberId();
     }
     
     // 장바구니 삭제
     @PostMapping("/cart/delete")
     public String deleteCartPost(CartDTO cart) {
    	 cartService.deleteCart(cart.getCartId());
    	 return "redirect:/cart/";
     }
     
     // 결제페이지 이동

     @GetMapping("/order")
     public String orderPageGet(HttpServletRequest request,String cart) {
    	 System.out.println(request.getSession().getAttribute("member"));
    	 
      return "/order";
     }
 }

