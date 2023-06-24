package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;
import com.project.service.AttachmentService;
import com.project.service.InventoryService;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private InventoryService inventoryService;

	@Autowired
	private AttachmentService attachmentService;

	@GetMapping("/index")
	public void indexGet() {
		log.info("어드민 인덱스 요청");
	}

	@GetMapping("/list")
	public void productListGet(Model model, Criteria cri) {
		log.info("상품 목록 요청");
		List<ProductDTO> list = productService.getAllProducts(cri);
		model.addAttribute("list", list);
		model.addAttribute("productCri", cri);
	}
	
	@GetMapping("/register")
	public void productRegisterGet() {
		log.info("상품 등록 폼 요청");
	}

	@Transactional
	@PostMapping("/register")
	public String productRegisterPost(ProductDTO productDTO) {
		log.info("상품 등록 요청 : " + productDTO.toString());
		productService.registerProduct(productDTO, productDTO.getColorList());
		productDTO.setProductId(String.valueOf(productService.getCurrentProductId()));
		inventoryService.stockInventory(productDTO);
		if(productDTO.getAttachmentList()!=null&&!productDTO.getAttachmentList().isEmpty()) {
			attachmentService.registerAttachment(productDTO);
		}
		return "redirect:/admin/product/list";
	}

	@GetMapping("/read/{productId}")
	public String productReadGet(Model model, @PathVariable String productId) {
		log.info("상품 상세 정보 요청 : " + productId);
		model.addAttribute("productDTO", productService.getSingleProduct(productId));
		model.addAttribute("inventoryList", inventoryService.getProductInventories(productId));
		return "/admin/product/read";
	}

	@Transactional
	@PostMapping("/modify")
	public String productModifyGet(ProductDTO productDTO, InventoryDTO inventoryDTO) {
		log.info("상품 페이지 상품 수정 요청 : " + productDTO.toString());
		productService.modifyProduct(productDTO);
		if (productDTO.isDiscontinued()) {
			inventoryService.closeInventory(productDTO.getProductId());
		}
		if(productDTO.getAttachmentList()!=null&&!productDTO.getAttachmentList().isEmpty()) {
		attachmentService.modifyAttachment(productDTO);
		}
		return "redirect:/admin/product/list";
	}
}