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

import com.project.domain.detail.CartDTO;
import com.project.domain.qna.Criteria;
import com.project.domain.qna.QnaDTO;
import com.project.domain.qna.QnaPageDTO;
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
	
	@GetMapping("/cart")
	public void cartGet() {
		log.info("cart 화면");		
	}

	@PostMapping("/cart")
	public String cartInsert(@RequestBody  CartDTO cart,RedirectAttributes rttr) {
		log.info("cart 로 데이터 보내기" + cart);		
		
//		if(service.cartInsert(cart)) {
//			rttr.addAttribute("productId",cart.getProductId());
//		}
		
		return "redirect:/shoes/detail";
		
	}
	@GetMapping("/qna")
	public void qnaGet() {
	
			log.info("qna 페이지 요청");
	}
	
	@PostMapping("/qna")
	public String qnaList(@ModelAttribute("cri") Criteria cri,@ModelAttribute("qna") QnaDTO qna,Model model) {
		log.info("qna 페이지 post");
		
	
		List<QnaDTO> list = qnaService.qnaList(cri);
		
		int total = qnaService.qnaTotal(cri);
		
		model.addAttribute("qna", qnaService.qnaList(cri));
		model.addAttribute("qnaPage", new QnaPageDTO(total, cri));
		
		
		
		
		return "/member/qna";
	}
	
}
