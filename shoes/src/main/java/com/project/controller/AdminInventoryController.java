package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.Criteria;
import com.project.domain.ProductDTO;
import com.project.service.InventoryService;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/inventory")
public class AdminInventoryController {

	@Autowired
	private ProductService productService;

	@Autowired
	private InventoryService inventoryService;

	@GetMapping("/list")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public void inventoryListGet(Model model, Criteria cri) {
		log.info("재고 목록 요청");
		List<ProductDTO> list = inventoryService.getAllInventories(cri);
		model.addAttribute("list", list);
		model.addAttribute("inventoryCri", cri);
	}

	@GetMapping("/read/{productId}")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public String inventoryReadGet(Model model, @PathVariable String productId, Criteria cri) {
		log.info("재고 상세 정보 요청 : " + productId);
		model.addAttribute("productDTO", productService.getSingleProduct(productId));
		model.addAttribute("inventoryList", inventoryService.getProductInventories(productId));
		model.addAttribute("inventoryCri", cri);
		return "/admin/inventory/read";
	}

	@Transactional
	@PostMapping("/modify")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public String inventoryModifyPost(ProductDTO productDTO) {
		log.info("재고 수정 요청 : " + productDTO.toString());
		productService.modifyProduct(productDTO);
		inventoryService.modifyInventory(productDTO);
		return "redirect:/admin/inventory/list";
	}

}
