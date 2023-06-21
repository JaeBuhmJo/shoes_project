package com.project.controller;

import java.util.List;
import java.util.Optional;

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
import com.project.service.DetailService;
import com.project.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private DetailService service;
	
	@Autowired
	private QnaService qnaService;
	

	//Optional<Integer> productId,
	
	@PostMapping("/cart")
	public String cartInsert(@RequestBody  CartDTO cart,RedirectAttributes rttr) {
		log.info("cart 로 데이터 보내기" + cart);		
		
//		if(productId.isPresent()) {
//			int id = productId.get();
//		}
		
		if(service.cartInsert(cart)) {
			rttr.addAttribute("productId",cart.getProductId());
		}
		
		return "redirect:/shoes/detail";
		
	}
	
	
	@GetMapping("/qna")
	public void qnaList(@ModelAttribute("cri") Criteria cri,Model model) {
		log.info("qna 페이지 get");
		
	
		
		
		List<QnaDTO> list = qnaService.qnaList(cri);
		
		int total = qnaService.qnaTotal(cri);
	
		model.addAttribute("list", list);
		model.addAttribute("qnaPage", new QnaPageDTO(cri, total));
		
		
	}
	
}
