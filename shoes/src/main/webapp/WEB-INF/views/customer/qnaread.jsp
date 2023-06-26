
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp"%>
 <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form class="col-md-9 m-auto" id="qnaForm" method="post" role="form">
                <div class="row">
                    <div class="mb-3" >
                        <label for="memberid">memberid</label>
                        <input type="text" class="form-control mt-1" id="memberid" name="memberid" readonly value="${qna.memberId}">
                        
                    </div>
                    <div class="mb-3">
                        <label for="title">title</label>
                        <input type="text" class="form-control mt-1" id="title" name="title" readonly value="${qna.title}">
                        
                    </div>
                </div>

                <div class="mb-3">
                    <label for="question">question</label>
                    <textarea class="form-control mt-1" id="question" name="question" readonly rows="8">
                    	${qna.question}
                    </textarea>
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="button" class="btn btn-success btn-lg px-3" onclick="location.href='/member/qna'">목록</button>
                        
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <form action="" id="operForm">
	<%-- QnaPageDTO.cri.page 가능 --%>
	<input type="hidden" name="qnaId" value="${qna.qnaId}" />
	<input type="hidden" name="page" value="${cri.page}" />
	<input type="hidden" name="amount" value="${cri.amount}" />

</form>
    
    <%@include file="../include/footer.jsp"%>