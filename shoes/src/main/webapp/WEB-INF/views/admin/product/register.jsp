<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminheader.jsp" %>
      <div id="layoutSidenav_content">
        <main>
            <div class="container py-1">
                <h3 class="mt-4">상품 신규 등록</h3>
     <form action="/admin/product/register" method="post">
     
        <div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label"><b>상품명</b></label>
		  <input type="text" class="form-control" id="exampleFormControlInput1" name="productName" placeholder="진열할 상품 이름 입력" required>
		</div>
     	<div class="row">  
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput2" class="form-label"><b>카테고리</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput2" name="category" placeholder="ex)러닝화, 구두" required>
			</div>
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput3" class="form-label"><b>브랜드</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput3" name="brand" placeholder="ex)Nike, Adidas" required>
			</div>
		</div>
		<div class="row">
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput4" class="form-label"><b>판매 가격</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput4" name="price" placeholder="정상 판매가 숫자만 입력" required>
			</div>
		</div>
		<div class="row">
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput6" class="form-label"><b>제조 국가명</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput6" name="productCountry" placeholder="제조 국가명 입력" required>
			</div>
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput7" class="form-label"><b>제조 연도</b></label>
			  <input type="number" class="form-control" id="exampleFormControlInput7" name="productYear" placeholder="연도만 기입" required>
			</div>
		</div>
		<div class="form-check form-switch">
		  <input class="form-check-input" type="checkbox" name="onSale"  role="switch" id="flexSwitchCheckChecked" value="1" checked>
		  <label class="form-check-label" for="flexSwitchCheckChecked" >판매하기</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
		  <label class="form-check-label" for="flexRadioDefault1">
		    남성화
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
		  <label class="form-check-label" for="flexRadioDefault2">
		    여성화
		  </label>
		</div>
		
		
		<hr>
		<b>사이즈별 재고 수량 입력</b>
		<div class="">
			<div class="input-group size-width m-1">
				<span class="input-group-text" id="basic-addon1">220</span>
				<input type="text" class="form-control text-end" name="quantity" placeholder="수량 입력" maxlength="4" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group size-width m-1">
				<span class="input-group-text" id="basic-addon1">230</span>
				<input type="text" class="form-control text-end" name="quantity" placeholder="수량 입력" maxlength="4" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group size-width m-1">
				<span class="input-group-text" id="basic-addon1">240</span>
				<input type="text" class="form-control text-end" name="quantity" placeholder="수량 입력" maxlength="4" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group size-width m-1">
				<span class="input-group-text" id="basic-addon1">250</span> 
				<input type="text" class="form-control text-end" name="quantity" placeholder="수량 입력" maxlength="4" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group size-width m-1">
				<span class="input-group-text" id="basic-addon1">260</span>
				<input type="text" class="form-control text-end" name="quantity" placeholder="수량 입력" maxlength="4" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group size-width m-1">
				<span class="input-group-text" id="basic-addon1">270</span> 
				<input type="text" class="form-control text-end" name="quantity" placeholder="수량 입력" maxlength="4" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group size-width m-1"> 
				<span class="input-group-text" id="basic-addon1">280</span>
				<input type="text" class="form-control text-end" name="quantity" placeholder="수량 입력" maxlength="4" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<div class="input-group size-width m-1">
				<span class="input-group-text" id="basic-addon1">290</span>
				<input type="text" class="form-control text-end" name="quantity" placeholder="수량 입력" maxlength="4" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
		</div>
		<hr>
        <div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label"><b>상품 상세정보</b></label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" name="detail" rows="3"></textarea>
		</div>
		<hr>
		<div class="input-group mb-3">
		  <label class="input-group-text" for="inputGroupFile01">상품 이미지</label>
		  <input type="file" class="form-control" id="attachment" name="attachment" multiple>
		</div>
		
		<div class="row row-cols-1 row-cols-md-6 g-6 mb-3 attachmentResult">
			
		</div>     
		    
		<button type="submit" class="btn btn-success">상품 등록</button>
		<button type="button" class="btn btn-secondary">목록으로</button>
	</form>
        </main>

<script src="/js/attachment.js"></script>
<script src="/js/admin-product-register.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>