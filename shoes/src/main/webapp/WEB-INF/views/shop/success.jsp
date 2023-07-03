<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<title>Zay Shop - Listing Page</title>

<!-- Start Content --> 
<div class="container py-5">
	<div class="row">
		<h1>구매 성공</h1>
	</div>
</div>
<!-- End Content -->

<script>
	const csrfToken = '${_csrf.token}';
</script>
	<!-- Bootstrap core JS-->
    <script src="/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/js/templatemo.js"></script>
    <script src="/assets/js/custom.js"></script>
	<script src="/js/list.js"></script>

	
<%@ include file="../include/footer.jsp"%>
