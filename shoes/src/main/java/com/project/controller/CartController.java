package com.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.AttachmentDTO;
import com.project.domain.CartDTO;
import com.project.service.AttachmentService;
import com.project.service.CartServiceImpl;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartServiceImpl cartServiceImpl;
	@Autowired
	private AttachmentService attachmentService;

	// 장바구니 페이지 이동
	@GetMapping("/")
	@PreAuthorize("isAuthenticated()")
	public void cartPageGet(Principal principal, Model model) {
		String memberId = principal.getName();
		List<CartDTO> cartList = cartServiceImpl.getCartList(memberId);
		CartDTO cartTotal = cartServiceImpl.getCartTotal(memberId);
		
		for (CartDTO cartDTO : cartList) {
			List<AttachmentDTO> attachmentDTOs = attachmentService.getAttachmentList(cartDTO.getProductId());
			AttachmentDTO attachmentDTO = attachmentDTOs.get(0);
			StringBuffer sb = new StringBuffer();
			sb.append(attachmentDTO.getUploadPath());
			sb.append("/");
			sb.append("thumb_");
			sb.append(attachmentDTO.getUuid());
			sb.append("_");
			sb.append(attachmentDTO.getFileName());
			cartDTO.setFilePath(sb.toString().replace("\\", "/"));
		}
		model.addAttribute("cartTotal", cartTotal);
		model.addAttribute("cartList", cartList);
	}
}
