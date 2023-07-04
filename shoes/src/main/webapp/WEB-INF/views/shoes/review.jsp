<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp"%>
 <!-- Start Contact -->
 			<security:authentication property="principal.memberDTO" 	var="userDetails" />
    <div class="container py-5">
        <div class="row py-5" id="reviewFildes">
            <form class="col-md-9 m-auto" action="/shoes/review" name="review" id="reviewForm" role="form" method="post">

				<fieldset>
					<span class="text-bold" id="reviewJumsu">별점을 선택해주세요</span>
					<input type="radio" name="jumsu" value="5" id="jumsu">
					<label for="rate1">5</label>
					<input type="radio" name="jumsu" value="4" id="jumsu">
					<label for="rate2">4</label>
					<input type="radio" name="jumsu" value="3" id="jumsu">
					<label for="rate3">3</label>
					<input type="radio" name="jumsu" value="2" id="jumsu">
					<label for="rate4">2</label>
					<input type="radio" name="jumsu" value="1" id="jumsu">
					<label for="rate5">1</label>
				</fieldset>
				

			<div class="mb-3">
                    <label for="contents" class="bg-light">후기</label>
                    <textarea class="form-control mt-1" id="contents" name="contents" placeholder="content" rows="8"></textarea>
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="submit" class="btn btn-success btn-lg px-3" id="qnaRegister" >등록</button>
                        <button type="button" class="btn btn-danger btn-lg px-3">취소</button>
                    </div>
                </div>

			<input type="hidden" name="memberId" value="${userDetails.memberId}" id="memberId" />
<%-- 			<input type="hidden" name="productId" value="${product.productId}" id="productId" />
 --%>			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
               
            </form>
        </div>
    </div>
    
    

<script>
//const productId = ${product.productId};
const csrfToken='${_csrf.token}';
</script>
   <script src="/powedetailjs/review.js"> </script>
    
<%@include file="../include/footer.jsp"%>


