<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
        <link href="/css/styles.css" rel="stylesheet" />
            <link rel="stylesheet" href="/assets/css/custom.css">  
<div id="layoutSidenav_content"> 
	<main>
		<div class="container my-5 py-3 chatroom border border-dark bg-primary bg-opacity-10"> 
			<div class="row align-items-center justify-content-between">  
				<h3 class="col-auto mb-0">실시간 상담</h3>
				<button type="button" class="col-auto btn btn-secondary me-3" id="disconnect-btn">상담 종료</button>
			</div>  
			<hr/>    
            <div id="msgArea" class="col chatroom-body "></div>
	    	<hr/> 
			<div class="chatroom-footer">
				<textarea id="msg" class="form-control textarea-msg" rows="3" cols="auto" wrap="hard"></textarea> 
				<div class=" d-flex flex-row-reverse">
					<button class="btn btn-warning d-flex flex-row-reverse" type="button" id="button-send">전송</button>
				</div>  
			</div> 
		</div>   
        <input type="hidden" value="${chatRoomId}" id="chatRoomId"/>
        <input type="hidden" value="${memberId}" id="memberId"/> 
<script>  
	const csrfToken = '${_csrf.token}';
</script> 
<!-- stomp, sockjs -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Bootstrap core JS-->
<script src="/assets/js/jquery-1.11.0.min.js"></script>
<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/templatemo.js"></script>
<script src="/js/room.js"></script>

<%@ include file="../include/footer.jsp"%> 