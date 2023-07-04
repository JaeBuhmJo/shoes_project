<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

	<!-- Start Content Page -->
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">비밀번호 찾기</h1>
			<p>저희 쇼핑몰에 오신걸 환영합니다.</p>
		</div>
	</div>

	<!-- Start Contact -->
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-12">
				<form class="col-md-9 m-auto" method="post" role="form" action="/member/findPassword">
					<div class="form-group mb-3 ">
						<label for="memberId">아이디</label>
						 <input type="text" class="form-control mt-1" id="memberId" name="memberId"
							placeholder="아이디" >
					</div>
					<div class="form-group mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control mt-1" id="email" name="email"
							placeholder="이메일">
							<button class="btn btn-info btn-lg px-3" type="button" id="emailConfirm">이메일 인증</button>
					</div>
					<div class="form-group mb-3">                       
					<label for="checkNumber">인증번호</label> <input type="text"                      
						class="form-control mt-1" id="checkNumber" name="checkNumber"
						placeholder="숫자 6자리" >
					<button class="btn btn-success btn-lg px-3" type="button" id="emailCheckConfirm">인증번호 확인</button>	
					<div class="invalid-feedback">인증번호를 확인해 주세요</div>
				</div>    
					<div class="col text-end mt-2">
						<button type="submit" id="submitButton" class="btn btn-danger btn-lg px-3" >비밀번호 수정</button>
					</div>                                                
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
				</form>
				                       
				
				
				<form class="col-md-9 m-auto" method="get" role="form">
					<div class="col text-end mt-2">
						<button type="button" class="btn btn-secondary  btn-lg px-3"
							onclick="location.href='/member/memberPage'">취소</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End Contact -->

	<script>
                                 
    //CSRF 토큰 값 생성                           
  	const csrfToken = '${_csrf.token}';
    </script>

	<!-- Start Script -->
	<script src="/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/templatemo.js"></script>
	<script src="/assets/js/findPassword.js"></script>
	<!-- End Script -->

	
<%@ include file="../include/footer.jsp"%>
