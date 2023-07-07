<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<title>Zay Shop - Listing Page</title>

<!-- Start Content -->
<div class="container py-5">
	<div class="row d-flex justify-content-center align-items-center vh-50 empty-list">
		<div class="col text-center">  
			<h1>구매 완료</h1>
			<h4>이용해 주셔서 감사합니다.</h4>
		</div>
	</div>
</div> 
<!-- End Content -->

<script>
	const csrfToken = '${_csrf.token}';
	setTimeout(() => {
		location.href = "/shop/list";
		}, 3000);
</script>
<!-- Bootstrap core JS-->
<script src="/assets/js/jquery-1.11.0.min.js"></script>
<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/templatemo.js"></script>

	
<%@ include file="../include/footer.jsp"%>

