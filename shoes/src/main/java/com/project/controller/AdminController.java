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

import com.project.domain.AttachmentDTO;
import com.project.domain.ColorSizeDTO;
import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.InventoryRequestDTO;
import com.project.domain.ProductDTO;
import com.project.service.AttachmentService;
import com.project.service.InventoryService;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

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

	@GetMapping("/register")
	public void registerGet() {
		log.info("상품 등록 폼 요청");
	}

	@GetMapping("/inventory/list")
	public void inventoryListGet(Model model, Criteria cri) {
		log.info("재고 목록 요청");
		List<ProductDTO> list = inventoryService.getAllInventories(cri);
		model.addAttribute("list", list);
		model.addAttribute("inventoryCri", cri);
	}

	@GetMapping("/product/list")
	public void productListGet(Model model, Criteria cri) {
		log.info("상품 목록 요청");
		List<ProductDTO> list = productService.getAllProducts(cri);
		model.addAttribute("list", list);
		model.addAttribute("productCri", cri);
	}

	@Transactional
	@PostMapping("/product/register")
	public String productRegisterPost(ProductDTO productDTO, InventoryRequestDTO inventoryRequestDTO) {
		log.info("상품 등록 요청 : " + productDTO.toString());
		productService.registerProduct(productDTO, inventoryRequestDTO.getColorList());
		String productId = String.valueOf(productService.getCurrentProductId());
		inventoryService.stockInventory(inventoryRequestDTO, productId);
//		attachmentService.registerAttachment(productDTO.getAttachmentList(), productId);
//		 상품 DB 등록
		
		// 첨부파일 DB등록
		List<AttachmentDTO> attachmentList = productDTO.getAttachmentList();
		if (attachmentList != null && attachmentList.size() > 0) {
			for (AttachmentDTO attachmentDTO : attachmentList) {
				attachmentDTO.setProductId(productId);
				log.info("첨부파일 등록 요청 : " + attachmentDTO.toString());
				attachmentService.registerAttachment(attachmentDTO);
			}
		}
		return "redirect:/admin/product/list";
	}
	
	@GetMapping("/inventory/read/{productId}")
	public String inventoryReadGet(Model model, @PathVariable String productId) {
		log.info("재고 상세 정보 요청 : " + productId);
		model.addAttribute("productDTO", productService.getSingleProduct(productId));
		model.addAttribute("inventoryList", inventoryService.getProductInventories(productId));
		return "/admin/inventory/read";
	}

	// 색상, 사이즈 목록을 가져와서 뿌려줘야함.
	@GetMapping("/product/read/{productId}")
	public String productReadGet(Model model, @PathVariable String productId) {
		log.info("상품 상세 정보 요청 : " + productId);
		model.addAttribute("productDTO", productService.getSingleProduct(productId));
		model.addAttribute("inventoryList", inventoryService.getProductInventories(productId));
		return "/admin/product/read";
	}

	@Transactional
	@PostMapping("/product/modify")
	public String productModifyGet(ProductDTO productDTO, InventoryDTO inventoryDTO) {
		log.info("상품 페이지 상품 수정 요청 : " + productDTO.toString());
		// 원래 있던 목록 지우고
		String productId = productDTO.getProductId();
		attachmentService.removeAttachmentList(productId);
		// 첨부파일 정보 바꾸기.
		if (productDTO.getAttachmentList() != null && productDTO.getAttachmentList().size() > 0) {
			for (AttachmentDTO attachmentDTO : productDTO.getAttachmentList()) {
				attachmentDTO.setProductId(productId);
				attachmentService.registerAttachment(attachmentDTO);
			}
		}
		return "redirect:/admin/product/list";
	}

	@Transactional
	@PostMapping("/inventory/modify")
	public String inventoryModifyGet(ProductDTO productDTO, InventoryDTO inventoryDTO,
			@RequestParam List<Integer> quantity) {
		log.info("재고 페이지 상품 수정 요청 : " + productDTO.toString());
		productService.modifyProduct(productDTO);
		// 수정 요
		return "redirect:/admin/inventory/list";
	}

	@GetMapping("/product/register")
	public void productRegisterGet() {
		log.info("상품 등록 폼 요청");
	}


}
