package com.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.CartDTO;
import com.project.domain.MemberDTO;
import com.project.domain.OrderPageDTO;
import com.project.domain.OrderProductDTO;
import com.project.service.CartService;
import com.project.service.InventoryService;
import com.project.service.MemberService;
import com.project.service.OrderService;
import com.project.service.PurchaseService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	private InventoryService inventoryService;

	@Autowired
	private CartService cartService;

	// 주문페이지 get

	@RequestMapping(value = "/Purchase", method = RequestMethod.GET)
	public String getPurchase(HttpSession session, String update, MemberDTO member, Model model, OrderProductDTO opd)
			throws Exception {
		log.info("get Purchase페이지");
		// 주문 주회 리스트

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		List<OrderProductDTO> getOrderList = orderService.orderList(memberDTO.getMemberId());

		model.addAttribute("getOrderList", getOrderList);

		return "/Purchase";
	}

	@GetMapping("/confirm")
	@Transactional
	@PreAuthorize("isAuthenticated()")
	public String purchaseGet(Principal principal) {
		try {
		String memberId = principal.getName();
		List<CartDTO> cartList = cartService.getCartList(memberId);
		
		for (CartDTO cartDTO : cartList) {
			// 산것들은 재고 감소치고
			inventoryService.decreaseInventory(cartDTO);
			// 구매 목록에 전부 담고
			purchaseService.savePurchaseLog(cartDTO);
		}
		// 카트는 비우고
		cartService.deleteCart(memberId);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/cart/";
		}
		return "redirect:/shop/success";
	}

}
