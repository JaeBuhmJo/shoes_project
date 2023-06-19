package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.Criteria;
import com.project.domain.ListPageDTO;
import com.project.domain.ProductDTO;
import com.project.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ProductService productService;

	@GetMapping("/list")
	public void listGet(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("list 요청");
		List<ProductDTO> list = productService.getSaleProducts(cri);
		int total = productService.getSaleCount();
		
		model.addAttribute("list", list);
		model.addAttribute("productListPage",new ListPageDTO(cri, total));
	}
}
