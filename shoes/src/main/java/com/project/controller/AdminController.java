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
import com.project.service.InventoryService;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	final int productSize = 220;
	final int productSizeIncrement = 10;

	@Autowired
	private ProductService productService;

	@Autowired
	private InventoryService inventoryService;

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

	@GetMapping("/inventory/read/{productId}")
	public String inventoryReadGet(Model model, @PathVariable String productId) {
		log.info("재고 상세 정보 요청 : " + productId);
		model.addAttribute("productDTO", productService.getSingleProduct(productId));
		model.addAttribute("inventoryList", inventoryService.getProductInventories(productId));
		return "/admin/inventory/read";
	}
	
	@GetMapping("/product/read/{productId}")
	public String productReadGet(Model model, @PathVariable String productId) {
		log.info("상품 상세 정보 요청 : " + productId);
		model.addAttribute("productDTO", productService.getSingleProduct(productId));
		model.addAttribute("inventoryList", inventoryService.getProductInventories(productId));
		return "/admin/product/read";
	}

	@Transactional
	@PostMapping("/product/modify")
	public String productModifyGet(ProductDTO productDTO, InventoryDTO inventoryDTO, @RequestParam List<Integer> quantity) {
		log.info("상품 수정 요청 : " + productDTO.toString());
		productService.modifyProduct(productDTO);
		int size = productSize;
		for (Integer amount : quantity) {
			inventoryDTO.setProductSize(size);
			boolean isStocked = inventoryService.isStocked(inventoryDTO);
			if (amount > 0) {
				inventoryDTO.setQuantity(amount);
				if (isStocked) {
					log.info("재고 수정 요청 : " + inventoryDTO.toString());
					inventoryService.modifyInventory(inventoryDTO);
				} else {
					log.info("재고 등록 요청 : " + inventoryDTO.toString());
					inventoryService.stockInventory(inventoryDTO);
				}
			} else {
				if(isStocked) {
					log.info("재고 삭제 요청 : " + inventoryDTO.toString());
					inventoryService.removeInventory(inventoryDTO);
				}
			}
			size += productSizeIncrement;
		}
		return "redirect:/admin/product/list";
	}
	
	@Transactional
	@PostMapping("/inventory/modify")
	public String inventoryModifyGet(ProductDTO productDTO, InventoryDTO inventoryDTO, @RequestParam List<Integer> quantity) {
		log.info("상품 수정 요청 : " + productDTO.toString());
		productService.modifyProduct(productDTO);
		int size = productSize;
		for (Integer amount : quantity) {
			inventoryDTO.setProductSize(size);
			boolean isStocked = inventoryService.isStocked(inventoryDTO);
			if (amount > 0) {
				inventoryDTO.setQuantity(amount);
				if (isStocked) {
					log.info("재고 수정 요청 : " + inventoryDTO.toString());
					inventoryService.modifyInventory(inventoryDTO);
				} else {
					log.info("재고 등록 요청 : " + inventoryDTO.toString());
					inventoryService.stockInventory(inventoryDTO);
				}
			} else {
				if(isStocked) {
					log.info("재고 삭제 요청 : " + inventoryDTO.toString());
					inventoryService.removeInventory(inventoryDTO);
				}
			}
			size += productSizeIncrement;
		}
		return "redirect:/admin/inventory/list";
	}
	

	@GetMapping("/product/register")
	public void productRegisterGet() {
		log.info("상품 등록 폼 요청");
	}

	@Transactional
	@PostMapping("/product/register")
	public String productRegisterPost(ProductDTO productDTO, InventoryDTO inventoryDTO, @RequestParam List<Integer> quantity) {
		log.info("상품 등록 요청 : " + productDTO.toString());
		productService.registerProduct(productDTO);
		inventoryDTO.setProductId(String.valueOf(productService.getCurrentProductId()));
		log.info("재고 등록 요청 : " + inventoryDTO.toString());
		int productSize = 220;
		for (Integer amount : quantity) {
			if (amount > 0) {
				inventoryDTO.setProductSize(productSize);
				inventoryDTO.setQuantity(amount);
				inventoryService.stockInventory(inventoryDTO);
			}
			productSize += 10;
		}
		return "redirect:/admin/product/list";
	}
}