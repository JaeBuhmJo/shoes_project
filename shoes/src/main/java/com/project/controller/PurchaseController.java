package com.project.controller;

import java.security.Principal;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.CartDTO;
import com.project.service.CartService;
import com.project.service.InventoryService;
import com.project.service.ProductService;
import com.project.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	private InventoryService inventoryService;

	@Autowired
	private CartService cartService;

	@GetMapping("/confirm")
	@Transactional
	@PreAuthorize("isAuthenticated()")
	public String purchaseGet(Principal principal, RedirectAttributes rttr) {
		try {
		String memberId = principal.getName();
		List<CartDTO> cartList = cartService.getCartList(memberId);
		
		for (CartDTO cartDTO : cartList) {
			// 산것들은 재고 감소치고
			if(inventoryService.getInventoryQuantity(cartDTO.getInventoryId())>=cartDTO.getCartAmount()) {
				inventoryService.decreaseInventory(cartDTO);
				productService.increaseSoldCount(cartDTO);
			}else {
				rttr.addFlashAttribute("productSoldOut",cartDTO.getProductName());
				return "redirect:/cart/";
			}
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
