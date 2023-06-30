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
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public void indexGet() {
		log.info("어드민 인덱스 요청");
	}

	@GetMapping("/list")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public void productListGet(Model model, Criteria cri) {
		log.info("상품 목록 요청");
		List<ProductDTO> list = productService.getAllProducts(cri);
		model.addAttribute("list", list);
		model.addAttribute("productCri", cri);
	}
	
	@GetMapping("/register")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public void productRegisterGet() {
		log.info("상품 등록 폼 요청");
	}

	@Transactional
	@PostMapping("/register")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
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
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public String productReadGet(Model model, @PathVariable String productId) {
		log.info("상품 상세 정보 요청 : " + productId);
		model.addAttribute("productDTO", productService.getSingleProduct(productId));
		model.addAttribute("inventoryList", inventoryService.getProductInventories(productId));
		return "/admin/product/read";
	}

	@Transactional
	@PostMapping("/modify")
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	public String productModifyGet(ProductDTO productDTO, InventoryDTO inventoryDTO) {
		log.info("상품 페이지 상품 수정 요청 : " + productDTO.toString());
		productService.modifyProduct(productDTO);
		if (productDTO.isDiscontinued()) {
			//상품 단종 요청시 해당 상품의 재고 모두 단종처리
			inventoryService.closeInventory(productDTO.getProductId());
		}
		if(productDTO.getAttachmentList()!=null&&!productDTO.getAttachmentList().isEmpty()) {
		attachmentService.modifyAttachment(productDTO);
		}
		return "redirect:/admin/product/list";
	}
}