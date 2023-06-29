<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp"%>
			<link href="/assets/css/star.css" rel="stylesheet" />
 <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5" id="reviewFildes">
            <form class="col-md-9 m-auto" action="" id="reviewForm" role="form" method="post">



				<fieldset>
					<span class="text-bold" id="reviewJumsu">별점을 선택해주세요</span>
					<input type="radio" name="reviewStar" value="5" id="rate1">
					<label for="rate1">5</label>
					<input type="radio" name="reviewStar" value="4" id="rate2">
					<label for="rate2">4</label>
					<input type="radio" name="reviewStar" value="3" id="rate3">
					<label for="rate3">3</label>
					<input type="radio" name="reviewStar" value="2" id="rate4">
					<label for="rate4">2</label>
					<input type="radio" name="reviewStar" value="1" id="rate5">
					<label for="rate5">1</label>
				</fieldset>
				

			

			<div class="mb-3">
                    <label for="content" class="bg-light">question</label>
                    <textarea class="form-control mt-1" id="content" name="content" placeholder="content" rows="8"></textarea>
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="submit" class="btn btn-success btn-lg px-3" id="qnaRegister" >등록</button>
                        <button type="button" class="btn btn-danger btn-lg px-3">취소</button>
                    </div>
                </div>
                
                
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
               
            </form>
        </div>
    </div>

<script>
const csrfToken='${_csrf.token}';
</script>
   <script src="/poweqnajs/question.js"> </script>
    
<%@include file="../include/footer.jsp"%>

