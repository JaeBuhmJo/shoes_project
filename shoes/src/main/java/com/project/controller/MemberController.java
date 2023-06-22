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
	
	@GetMapping("/info")
	public void info() {
		
	}
	@GetMapping("/cart")
	public void cart() {
		
	}
	
	@PostMapping
	public String cartInsert(@RequestBody  CartDTO cart,Model model,RedirectAttributes rttr) {
		log.info("cart 로 데이터 보내기" + cart);		
		

		
		if(service.cartInsert(cart)) {
			model.addAttribute("cart", cart);
			rttr.addAttribute("memberId", cart.getMemberId());
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
	@GetMapping("/question")
	public void qnaInsert() {
		log.info("질문 작성 창 띄우기");
	}
	@PostMapping("/question")
	public String qnaPost(@RequestBody QnaDTO qna, RedirectAttributes rttr,Criteria cri) {
		
		log.info("qna Post");
		
		if(qnaService.qnaInsert(qna)) {
			rttr.addAttribute("qndId", qna.getQnaId());
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("amount", cri.getAmount());
			return "redirect:/member/qna";
		}
		log.info("글 작성 성공");
		return "/redirect:/member/question";

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
