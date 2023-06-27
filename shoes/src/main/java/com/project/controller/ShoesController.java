package com.project.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;import org.springframework.boot.context.config.StandardConfigDataLocationResolver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.CartDTO;
import com.project.domain.ColorSize;
import com.project.domain.Criteria;
import com.project.domain.InventoryDTO;
import com.project.domain.QnaDTO;
import com.project.domain.QnaPageDTO;
import com.project.domain.ReviewDTO;
import com.project.domain.ReviewPageDTO;
import com.project.service.DetailService;


import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping("/shoes")
public class ShoesController {

	@Autowired
	private DetailService service;

	
	@GetMapping("/sale")
	public void saleGet() {
		log.info("sale 화면");

	}
	@GetMapping("/detail")
	public void detailRead(Model model,String productId,@ModelAttribute("cri") Criteria cri) {
		log.info("detail 화면");
		

		//model 은 jsp에서 여기선 product.productId,product.price등의 값들을 주기 위해 사용
		model.addAttribute("product", service.detail(productId));
		//색상 		
		model.addAttribute("color", service.color(productId));		
		

		List<ReviewDTO> list = service.reviewList(cri);
		
		model.addAttribute("list", list);
		int total = service.reviewTotal(cri);
	
		model.addAttribute("reviewPage", new ReviewPageDTO(cri, total));
	}
	
	
	//데이터만 넘김
	@GetMapping("/size")
	@ResponseBody
	public List<ColorSize> getSize(String productId,String productColor,Model model){
		model.addAttribute("size", service.size(productId, productColor));
		return service.size(productId, productColor);
		
	}
	
	

	
	
	
	
	
	
	
	
}
