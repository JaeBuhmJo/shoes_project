package com.project.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.Criteria;
import com.project.domain.MemberDTO;
import com.project.domain.OrderListDTO;
import com.project.domain.QnaPageDTO;
import com.project.service.MemberService;
import com.project.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private OrderService orderService;

	@GetMapping("/register")
	public void registerGet() {
		log.info("회원가입 폼 요청");
	}

	@PostMapping("/register")
	public String registerPost(MemberDTO memberDTO) {
		log.info("회원가입 요청", memberDTO);
		if (service.register(memberDTO)) {
			return "redirect:/member/login";
		} else {
			return "/member/register";
		}
	}                         

	@PostMapping("/dupid")
	@ResponseBody // fetch 에 결과값을 바로 받으려고
	public String dupid(String memberId) {
		log.info("중복 아이디 체크 " + memberId);
	boolean idCheck	= service.dupid(memberId);
	if (idCheck) {
		return "true";
	} else {
		return "false";
	}
	}
	
	
	@GetMapping("/login")
	public void loginGet() {
		log.info("로그인 폼 요청");
	}

	@GetMapping("/login-error")
	public String loginError(Model model) {
		log.info("에러 발생");
		model.addAttribute("error", "아이디나 비빌번호를 확인해주세요");
		return "/member/login";
	}

	@PreAuthorize("hasAnyAuthority('ROLE_USER','ROLE_ADMIN')")
	@GetMapping("/modify")
	public void modifyGET() {
		log.info("수정페이지 요청" );
		
	}

	@PreAuthorize("hasAnyAuthority('ROLE_USER','ROLE_ADMIN')")
	@PostMapping("/modify")
	public String modifyPost(MemberDTO memberDTO, HttpSession session) {
		log.info("비밀번호 수정 요청 " + memberDTO);
		if (memberDTO.passwordEquals()) {
			// 현재 비밀번호 일치 확인
			// true : 비밀번호 변경 ==> session 제거 ==> 로그인 페이지 보여주기
			// false : 비빌번호변경 페이지 보여주기

			// 비밀번호 변경
			if (service.update(memberDTO)) {
				session.invalidate();
				return "redirect:/member/login";
			}

		}
		return "redirect:/member/modify";

	}
	@PreAuthorize("hasAnyAuthority('ROLE_USER')")
	@GetMapping("/remove")
	public void removeGet() {
		log.info("회원탈퇴 요청");
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_USER')")
	@PostMapping("/remove")
	public String removePost(MemberDTO memberDTO, HttpSession session) {
		log.info("회원 탈퇴 페이지 요청 " + memberDTO);

		if (service.remove(memberDTO)) {
			session.invalidate();
			return "redirect:/";
		} else {
			return "redirect:/member/remove";
		}
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_USER')")
	@GetMapping("/memberDetail")  
	public void memberDetailGet() {
		log.info("유저 상세페이지");
		 
	}
	
	// 주문 내역 불러오기
	@PreAuthorize("hasAnyAuthority('ROLE_USER')")
	@GetMapping("/memberPage")  
	public void memberPageGet(Principal principal,Model model, @ModelAttribute("cri") Criteria cri) {
		
		log.info("페이지 나누기 요청"+cri);
		
		// 로그인한 아이디 
		String memberId = principal.getName();
		// 아이디 참고하여 주문목록 가져오기
		List<OrderListDTO> list = orderService.list(memberId,cri);
		// 주문내역 총 갯수
		int total = orderService.getTotalCnt(memberId,cri);
		//log.info("searchType " + Arrays.toString(cri.getTypeArr())); // P

		log.info("리스트 " + list);		
		log.info("총 갯수" + total);
		// 주문 내역 저장
		model.addAttribute("orderList", list);
		model.addAttribute("pageDTO", new QnaPageDTO(cri,total));
	
	}
	
	@GetMapping("/findPassword")
	public void changePasswordGet() {
		log.info("비밀번호 찾기 페이지 요청");
	}

	@PostMapping("/findPassword")
	public String changePasswordPost(MemberDTO memberDTO,Model model) {
		log.info("정보요청 "+memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		return "/nonloginmodify";
	}
	
}
