<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>


	<!-- Start Content Page -->
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">로그인 페이지</h1>
		</div>
	</div>
	<!-- Start Contact -->

	<div class="text-center">
		<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
	</div>
	<form class="user" method="post" action="/login">
		<div class="form-group" style="text-align: center;">
			<input type="text" id="username" placeholder="아이디" name="memberId"
				size="50">
		</div>
		<div class="form-group" style="text-align: center;">
			<input type="password" id="password" placeholder="비밀번호"
				name="password" size="50">
		</div>
		<div class="form-group" style="text-align: center;">
			<div class="custom-control custom-checkbox small">
				<input type="checkbox" class="custom-control-input" id="customCheck"
					name="remember-me"> <label class="custom-control-label"
					for="customCheck">Remember Me</label>
			</div>
		</div>
		<div style="text-align: center;">
			<button class="btn btn-primary" style="width: 470px; height: 40px;">로그인</button>
		</div>

		<%-- 로그인 에러 메세지 보여주기 --%>
		<div class="text-danger text-center mt-2" style="text-align: center;">
			<small class="text-danger">${error}</small>
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<hr>
	<div class="text-center">
		<a class="small" href="/member/findPassword">비밀번호를 잊으셨나요?</a>
	</div>
	<div class="text-center">
	<a href="/member/register">회원가입</a>
	</div>


	
	<!-- End Contact -->

	<!-- Start Script -->
	<script src="/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/templatemo.js"></script>
	<script src="/assets/js/custom.js"></script>
	<!-- End Script -->

	
<%@ include file="../include/footer.jsp"%>
