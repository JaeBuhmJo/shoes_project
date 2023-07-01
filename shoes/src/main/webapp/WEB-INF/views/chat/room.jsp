<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<div class="container py-5">
		<h3 class="mt-4 pb-2">실시간 상담 - BLACKPEARL</h3>
		<hr />
            <div class="col-6">   
                <h1 class="roomName"></h1>   
                <h4 class="userId"></h4> 
            </div>   
            <div>       
                <div id="msgArea" class="col"></div>   
                
                <div class="col-6">     
                    <div class="input-group mb-3">  
                        <input type="text" id="msg" class="form-control">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
                        </div>
                    </div> 
                </div> 
            </div>  
            <div class="col-6"></div> 
        <button id="disconnect-btn">실시간 상담 종료</button>
        <input type="hidden" value="${chatRoomId}" id="chatRoomId"/>
        <input type="hidden" value="${memberId}" id="memberId"/> 
 </div>       
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
<script src="/assets/js/custom.js"></script>
<script src="/js/room.js"></script>

<%@ include file="../include/footer.jsp"%> 