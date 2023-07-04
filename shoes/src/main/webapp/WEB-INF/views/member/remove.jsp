<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

	<!-- Start Content Page -->
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">회원 탈퇴</h1>
			<p>저희 쇼핑몰에 오신걸 환영합니다.</p>
		</div>
	</div>

	<!-- Start Contact -->
	<div class="container py-5">
		<div class="row">
			<%@ include file="../include/membersidebar.jsp"%>
			<div class="col-lg-9">
				<security:authentication property="principal.memberDTO"
					var="userDetails" />
				<form class="col-md-9 m-auto" method="post" role="form">
					<div class="form-group mb-3 ">
						<label for="memberId">아이디</label> <input type="text"
							class="form-control mt-1" id="memberId" name="memberId"
							placeholder="아이디" value="${userDetails.memberId}" readonly>
					</div>
					<div class="form-group mb-3">
						<label for="password">기존 비밀번호</label> <input type="password"
							class="form-control mt-1" id="password" name="password"
							placeholder="비밀번호" value="">
					</div>
					<div class="col text-end mt-2">
						<button type="submit" class="btn btn-danger btn-lg px-3">회원탈퇴</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
				</form>
				<form class="col-md-9 m-auto" method="get" role="form">
					<div class="col text-end mt-2">
						<button type="button" class="btn btn-secondary  btn-lg px-3"
							onclick="location.href='/member/memberPage'">취소</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}"> <input type="hidden"
							style="color: black;" class="form-control mt-1" id="memberId"
							name="memberId" placeholder="아이디" value="${userDetails.memberId}"
							readonly>
					</div>
				</form>
			</div>
		</div>
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
