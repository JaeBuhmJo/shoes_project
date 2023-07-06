<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/header.jsp"%>

	<!-- Start Content Page -->
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">회원 수정</h1>
			<p>저희 쇼핑몰에 오신걸 환영합니다.</p>
		</div>
	</div>

	<!-- Start Contact -->
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-12">
				<form class="col-md-9 m-auto" method="post" role="form" action="/nonloginmodify">
				<div style="display: flex; flex-direction: column; align-items: center; ">
					<div class="form-group mb-3">
						<label for="password">신규 비밀번호</label> <input type="password"
							class="form-control mt-1" id="newPassword" name="newPassword"
							placeholder="비밀번호" style="border-radius: 8px; border-color: black; height: 40px; width : 400px;" required>
					</div>
					<div class="form-group mb-3">
						<label for="password">재확인 비밀번호</label> <input type="password"
							class="form-control mt-1" id="confirmPassword" name="confirmPassword"
							placeholder="비밀번호" style="border-radius: 8px; border-color: black; height: 40px; width : 400px;" required>
							</div>
					</div>
					<div class="row">
						<div class="col text-end mt-2">
							<button type="submit" class="btn btn-success btn-lg px-3">비밀번호 수정</button>
						</div>
					</div>
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="name" value="${memberDTO.name}">
					<input type="hidden" name="memberId" value="${memberDTO.memberId}">
				</form>
				<form class="col-md-9 m-auto" method="get" role="form">
					<div class="col text-end mt-2">
						<button type="button" class="btn btn-secondary  btn-lg px-3"
							onclick="location.href='/member/memberPage'">취소</button>
					</div>
				</form>
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
	
<%@ include file="include/footer.jsp"%>
