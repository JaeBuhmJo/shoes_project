<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

	<!-- Start Content Page -->
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">회원 상세페이지</h1>
			<p>저희 쇼핑몰에 오신걸 환영합니다.</p>
		</div>
	</div>

	<!-- Start Contact -->
	<security:authentication property="principal.memberDTO"
		var="userDetails" />
	<div class="container py-5">
		<div class="row">
			<%@ include file="../include/membersidebar.jsp"%>
			<div class="col-lg-9">
				<form class="col-md-9 m-auto" method="get" role="form"
					action="/member/modify">
					<div class="form-group mb-3">
						<label for="memberId">아이디</label> <input type="text"
							class="form-control mt-1" id="memberId" name="memberId"
							placeholder="아이디" value="${userDetails.memberId }" readonly>
					</div>
					<div class="form-group mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control mt-1" id="name" name="name" placeholder="이름"
							value="${userDetails.name }" readonly>
					</div>
					<div class="form-group mb-3">
						<label for="phone">휴대폰</label> <input type="text"
							class="form-control mt-1" id="phone" name="phone"
							placeholder="휴대폰" value="${userDetails.phone }" readonly>
					</div>
					<div class="form-group mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control mt-1" id="address" name="address"
							placeholder="주소" value="${userDetails.address }" readonly>
					</div>
					<div class="form-group mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control mt-1" id="email" name="email"
							placeholder="이메일" value="${userDetails.email }" readonly>
					</div>
					<div class="form-group mb-3">
						<label for="footSize">발사이즈</label> <input type="text"
							class="form-control mt-1" id="footSize" name="footSize"
							placeholder="발사이즈" value="${userDetails.footSize }" readonly>
					</div>
					<div class="row">
						<div class="col text-end mt-2">
							<button type="submit" class="btn btn-success btn-lg px-3">회원수정</button>
						</div>
					</div>
					<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
				</form>
				<form class="col-md-9 m-auto" method="get" role="form"
					action="/member/remove">
					<input type="hidden" class="form-control mt-1" id="memberId"
						name="memberId" placeholder="아이디" value="${userDetails.memberId }"
						readonly>
					<div class="col text-end mt-2">
						<button type="submit" class="btn btn-danger btn-lg px-3">회원탈퇴</button>
					</div>
				</form>
				<form class="col-md-9 m-auto" action="/logout" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="col text-end mt-2">
						<button class="btn btn-info btn-lg px-3" type="submit">로그아웃</button>
					</div>
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
	</div>                        

	<!-- Start Script -->
	<script src="/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/templatemo.js"></script>
	<script src="/assets/js/custom.js"></script>
	<!-- End Script -->

	
<%@ include file="../include/footer.jsp"%>
