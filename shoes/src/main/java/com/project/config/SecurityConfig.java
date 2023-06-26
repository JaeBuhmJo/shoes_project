package com.project.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.project.Handler.LoginSuccessHandler;
import com.project.service.CustomUserDetailService;

@Configuration // 환경설정
@EnableWebSecurity //  1. Spring Security의 기본 보안 구성을 활성화 
				   //  2. 특정 URL에 대한 접근 권한, 인증 방식, 로그인 페이지 등을 구성할 수 있다.
				   //  3. WebSecurityConfigurerAdapter를 상속하는 사용자 정의 보안 구성 클래스를 작성
			       //  3. 동작을 세부적으로 제어하고 사용자 정의 보안 규칙을 구성
		           //  4. CSRF 보호 기능도 함께 활성화
@EnableGlobalMethodSecurity(prePostEnabled = true) // @PreAuthorize  컨트롤러에서 사용할 수 있게
public class SecurityConfig {
	
	@Autowired
	private DataSource dataSource;
	
	// 시큐리티 사용하면 비밀번호 암호화해야 db작업됨
	// 비밀번호 암호화
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new LoginSuccessHandler();
	}
	
	@Bean
	public UserDetailsService customUsersService() {
		return new CustomUserDetailService();
	}
	
	 // security-context 시큐리티설정
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUsersService()).passwordEncoder(passwordEncoder());
	}
	
	@Bean
	protected SecurityFilterChain configure(HttpSecurity http) throws Exception{
	
		// 한글 필터 적용
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("utf-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);
		
		// 로그인 관련 설정
		http.formLogin().loginPage("/member/login") // 로그인 페이지 설정
		  				.usernameParameter("memberId") // 멤버아이디 받는 곳 "name=username"  
//		  				.usernameParameter("password") // 멤버비밀번호 받는 곳 "name=password"  
		  				.loginProcessingUrl("/login") // 로그인을 요청했을 때 위 주소에서 처리
		  				.successHandler(loginSuccessHandler())
		  				// .failureHandler(null)
		  				// 로그인 요청을 처리하는 URL을 설정 즉, 사용자가 로그인 버튼을 클릭하면 POST 요청이 전송되어 로그인 처리가 수행 
		  				// /member/login일 때는 주소가 login으로 바꾸고 404에러 /login으로 바꾸니까 주소는 index인데 404 에로
		  				//.defaultSuccessUrl("/") // 로그인 성공 후 어디로 갈지 나타내는 코드
						.failureUrl("/member/login-error"); // 로그인 실패 시 이동할 URL을 설정하는 역할
		
		http.logout()
			.logoutSuccessUrl("/");
	
		http.rememberMe()
			.tokenRepository(perTokenRepository())
			.tokenValiditySeconds(604800);
		
		return http.getOrBuild();
	}
	
	// PersistentTokenRepository는 CSRF 토큰을 영구 저장하고 관리하기 위한 인터페이스
	// JdbcTokenRepositoryImpl은 PersistentTokenRepository 인터페이스를 구현한 JDBC 기반의 구현체
	// JdbcTokenRepositoryImpl 객체를 생성하고, 해당 객체에 데이터베이스 연결을 위한 데이터 소스(DataSource)를 설정한 후 반환
	// CSRF 토큰이 데이터베이스에 저장되고 관리
	@Bean
	public PersistentTokenRepository perTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
}
