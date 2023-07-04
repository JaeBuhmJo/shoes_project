<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">실시간 1:1 채팅상담</h1>
			<p>판매자와 실시간으로 상담하세요.</p>
		</div>
	</div>
<div class="container py-5">

	<div class="row">
	<%@ include file="../include/membersidebar.jsp"%>
	<div class="col-lg-9">
		<div class="mx-4">
		
		<h3 class="mt-4 pb-2">실시간 상담 목록</h3>
		<hr />
	 
		<div class="list-group chatroom-list-div-customer" id="chatroomlist">
		</div>
		 
		<button class="btn btn-primary mt-2" id="createChat">신규 문의하기</button>
		</div>
		</div>
	</div>
</div>

<script>
	const csrfToken = '${_csrf.token}';
</script> 
<!-- Bootstrap core JS-->
<script src="/assets/js/jquery-1.11.0.min.js"></script>
<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/templatemo.js"></script>
<script src="/js/rooms.js"></script>    

<%@ include file="../include/footer.jsp"%> 