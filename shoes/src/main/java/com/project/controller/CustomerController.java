package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private DetailService service;
	
	@Autowired
	private QnaService qnaService;
	

	//Optional<Integer> productId,
	
	@GetMapping("/info")
	public void info() {
		
	}
	
	// 카트로 데이터 상품의 데이터 보내기 redirect로 주소줄에 띄워주고 
	@PostMapping("/cart")
	public String cartInsert(@RequestBody  CartDTO cart,RedirectAttributes rttr) {
		log.info("cart 로 데이터 보내기" + cart);		
		
		if(service.cartInsert(cart)) {
			rttr.addAttribute("productId", cart.getProductId());
			rttr.addAttribute("memberId", cart.getMemberId());

			
			
		}
		return "redirect:/shoes/detail";
		
	}
	
	
	@GetMapping("/qna")
	public void qnaList(@ModelAttribute("cri") Criteria cri,Model model) {
		log.info("qna 페이지 get");
		
	
		
		
		List<QnaDTO> list = qnaService.qnaList(cri);
		
		model.addAttribute("list", list);
		int total = qnaService.qnaTotal(cri);
	
		model.addAttribute("qnaPage", new QnaPageDTO(cri, total));
		
		
	}
	@GetMapping("/question")
	@PreAuthorize("isAuthenticated()")
	public void qnaInsert() {
		log.info("질문 작성 창 띄우기");
	}
	@PostMapping("/question")
	public String qnaPost(QnaDTO qna, RedirectAttributes rttr,Criteria cri) {
		
		log.info("qna Post");
		
		if(qnaService.qnaInsert(qna)) {
			rttr.addFlashAttribute("result", qna.getMemberId());

			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("amount", cri.getListAmount());
			log.info("insert"+qna);
			return "redirect:/member/qna";
		}

		return "/member/question";

	}
	@GetMapping("/qnaread")
	public void qnaRead(int qnaId,Model model, Criteria cri) {
		log.info("질문 폼 읽기");
		
		QnaDTO qna = qnaService.qnaRead(qnaId);
		model.addAttribute("qna",qna );
		
		log.info("qnaid 읽기"+qnaId);
		log.info("question 읽기"+qna.question);
		log.info("memberid 읽기"+qna.memberId);
		
		
		
	}
	
}
