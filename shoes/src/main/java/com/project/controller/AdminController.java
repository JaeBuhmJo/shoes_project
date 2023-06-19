package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.ProductDTO;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("/index")
	public void indexGet() {
		log.info("어드민 인덱스 요청");
	}
	
	@GetMapping("/register")
	public void registerGet() {
		log.info("상품 등록 폼 요청");
	}
	
	@GetMapping("/product/list")
	public void productListGet(Model model,Criteria cri) {
		log.info("상품 목록 요청");
		log.info("list 요청");
		List<ProductDTO> list = productService.getAllProducts(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("productListCri",cri);
	}
	
	@GetMapping("/product/read")
	public void productReadGet() {
		log.info("상품 상세 정보 요청");
	}
	
	@GetMapping("/product/modify")
	public void productModifyGet() {
		log.info("상품 수정 폼 요청");
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
		//리스트 불러와서 재고들 등록 - 이거 꼭 세련되게 바꾸자
		inventoryDTO.setProductId(String.valueOf(productService.getCurrentProductId()));
		log.info("재고 등록 요청 : " + inventoryDTO.toString());
		int productSize = 220;
		for (Integer amount : quantity) {
			if(amount>0) {
			inventoryDTO.setProductSize(productSize);
 			inventoryDTO.setQuantity(amount);
			productService.stockInventory(inventoryDTO);
			}
			productSize+=10;
		}
		return "redirect:/admin/product/register";
	}
}
