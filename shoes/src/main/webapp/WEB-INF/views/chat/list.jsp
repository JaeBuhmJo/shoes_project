<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<div class="container py-5">
	<h3 class="mt-4 pb-2">실시간 상담 목록</h3>
	<hr />
 
	<div class="list-group" id="chatroomlist">
	</div>
	
	<button class="btn btn-primary mt-2" id="createChat">신규 문의하기</button>
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