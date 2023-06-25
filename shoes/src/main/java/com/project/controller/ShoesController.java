package com.project.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.CartDTO;
import com.project.domain.Criteria;
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
	public void detailRead(Model model, int productId,@ModelAttribute("cri") Criteria cri) {
		log.info("detail 화면");

		//model 은 jsp에서 여기선 product.productId,product.price등의 값들을 주기 위해 사용
		model.addAttribute("product", service.detail(productId));

List<ReviewDTO> list = service.reviewList(cri);
		
		model.addAttribute("list", list);
		int total = service.reviewTotal(cri);
	
		model.addAttribute("reviewPage", new ReviewPageDTO(cri, total));
	}

//	@GetMapping("/detail")
//	public void qnaList(@ModelAttribute("cri") Criteria cri,Model model) {
//		log.info("qna 페이지 get");
		
	
		
		
//		List<ReviewDTO> list = service.reviewList(cri);
		
//		model.addAttribute("list", list);
//		int total = service.reviewTotal(cri);
	
//		model.addAttribute("reviewPage", new ReviewPageDTO(cri, total));
		
		
//	}
	
	
	
	
	
	
	
	
}
