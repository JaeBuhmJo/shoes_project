package com.project.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.service.EmailService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // @RequiredArgsConstructor은 클래스의 final 필드를 기반으로 파라미터를 갖는 생성자를 자동으로 생성
@RestController // 기본적으로 데이터를 HTTP 응답 본문으로 반환
// 이메일 인증 컨트롤러
public class AccountController {

    private final EmailService emailService;
    
    @PostMapping("/member/mailConfirm") 
    //@ResponseBody  //@RestController를 사용하고 있어 생략가능
	public String mailConfirmPost(@RequestParam String email, Model model ) throws Exception {
        String code = emailService.sendSimpleMessage(email);
        log.info("인증코드 : " + code);
        //model.addAttribute("code", code);
        return code;
    }
}
