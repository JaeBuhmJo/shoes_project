<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp"%>
 <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form class="col-md-9 m-auto" action="" id="qnaForm" role="form" method="post">
                <div class="row">
                    <div class="mb-3" >
                        <label for="memberid">아이디</label>
                        <input type="text" class="form-control mt-1" id="memberid" name="memberId">
                    </div>
                    <div class="mb-3">
                        <label for="title">title</label>
                        <input type="text" class="form-control mt-1" id="title" name="title" placeholder="title">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="question">question</label>
                    <textarea class="form-control mt-1" id="question" name="question" placeholder="question" rows="8"></textarea>
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="submit" class="btn btn-success btn-lg px-3" id="qnaRegister" >등록</button>
                        <button type="reset" class="btn btn-danger btn-lg px-3">취소</button>
                    </div>
                </div>
                <!-- productId -->
                <input type="hidden" name="productId"  value='<%=request.getParameter("productId")%>'/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
               
            </form>
        </div>
    </div>
    <form action="" id="operForm">
	
	<input type="hidden" name="memberId" value="${member.memberId}" />
	

</form>
<script>
const csrfToken='${_csrf.token}';
</script>
   <script src="/poweqnajs/question.js"> </script>
    
    <%@include file="../include/footer.jsp"%>
    







