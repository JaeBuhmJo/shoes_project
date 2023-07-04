package com.project.Handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.project.domain.CustomUser;
import com.project.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	// 로그인 성공 후 시작 페이지로 돌아가는 데
	// 로그인 성공 후 특정 작업 추가하고 싶거나 이동해야 하는 경로 지정
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
			
			
			// 로그인 사용자의 권한 확인
			CustomUser user = (CustomUser)authentication.getPrincipal();
			MemberDTO memberDTO = user.getMemberDTO();
			System.out.println("user "+memberDTO.getAuthority());
			
			
			// ROLE_ADMIN 이라면 ADMINPAGE 이동, ROLE_USER 라면 INDEX 이동		
			if (memberDTO.getAuthority().contains("ROLE_ADMIN")) {
				response.sendRedirect("/admin/index");					
				return;
			}
			
			response.sendRedirect("/");
	}

}
