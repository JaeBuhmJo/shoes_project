<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/adminheader.jsp"%>


<div id="layoutSidenav_content">
	<main>
		<div class="container py-3">
			<h3 class="mt-4 pb-2">실시간 상담 목록</h3>
			<hr />
			<div class="list-group chatroom-list-div" id="chatroomlist"></div>
		</div>
	</main>
  
<script>  
	const csrfToken = '${_csrf.token}';
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/admin.js"></script>
<script src="/js/rooms.js"></script>

<%@ include file="../../include/adminfooter.jsp"%>
