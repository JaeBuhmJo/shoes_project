<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminheader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <div id="layoutSidenav_content">
        <main>
            <div class="container py-1">
                <h3 class="mt-4">상품 조회/수정</h3> 
     <form action="/admin/product/modify" method="post" id="modifyForm">
 <hr/>
		<label for="listGroup1" class="col-sm-2"><b>카테고리</b></label>
        <ul class="list-group col-sm-2" id="listGroup1" >
		  <li class="list-group-item ">
		    <input class="form-check-input me-1" type="radio" name="category" value="running" id="firstRadio" checked>
		    <label class="form-check-label" for="firstRadio">운동화</label>
		  </li>
		  <li class="list-group-item ">
		    <input class="form-check-input me-1" type="radio" name="category" value="shoes" id="secondRadio">
		    <label class="form-check-label" for="secondRadio">구두</label>
		  </li>
		  <li class="list-group-item">
		    <input class="form-check-input me-1" type="radio" name="category" value="slipper" id="thirdRadio">
		    <label class="form-check-label" for="thirdRadio">슬리퍼</label>
		  </li>
		</ul>
     <hr/>
        <div class="mb-3 row">
			<label for="formControlInput1" class="col-sm-2 col-form-label"><b>상품코드</b></label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="formControlInput1" name="productId" value="${productDTO.productId }" readonly>
			</div>
		</div>
     <hr/>
        <div class="mb-3 row">
			<label for="formControlInput1" class="col-sm-2 col-form-label"><b>상품명</b></label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="formControlInput1" name="productName" value="${productDTO.productName }" required>
			</div>
		</div>
     <hr/>
        <div class="mb-3 row">
			<label for="formControlInput3" class="col-sm-2 col-form-label"><b>브랜드</b></label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="formControlInput3" name="brand" value="${productDTO.brand }" required>
			</div>
		</div>
     <hr/>
        <div class="mb-3 row">
			  <label for="formControlInput4" class="col-sm-2 col-form-label"><b>판매 가격</b></label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="formControlInput4" name="price" value="${productDTO.price }" required>
			</div>
		</div>
     <hr/>
        <div class="mb-3 row">
			  <label for="formControlInput6" class="col-sm-2 col-form-label"><b>제조 국가명</b></label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="formControlInput6" name="productCountry" value="${productDTO.productCountry }" required>
			</div>
		</div>
     <hr/>
        <div class="mb-3 row">
			  <label for="formControlInput7" class="col-sm-2 col-form-label"><b>제조 연도</b></label>
			<div class="col-sm-2">
			  <input type="number" class="form-control" id="formControlInput7" name="productYear" value="${productDTO.productYear }" required>
			</div>
		</div>
		
     <hr/>
        <div class="mb-3 row">
			  <label for="" class="col-sm-2 col-form-label"><b>타겟 고객</b></label>
			<div class="col-sm-2">
				<div class="form-check col">
				  <input class="form-check-input" type="checkbox" name="forMen" value="1" id="flexCheckDefault1" ${productDTO.forMen?'checked':''}>
				  <label class="form-check-label" for="flexCheckDefault1">남성</label>
				</div>
				<div class="form-check col">
				  <input class="form-check-input" type="checkbox" name="forWomen" value="1" id="flexCheckDefault2" ${productDTO.forWomen?'checked':''}>
				  <label class="form-check-label" for="flexCheckDefault2">여성</label>
				</div>
			</div>
		</div>
		<hr>
		<div class="mb-3 row">
			  <label for="" class="col-sm-2 col-form-label"><b>판매 여부</b></label>
			<div class="col-sm-2">
				<div class="form-check col">
				  <input class="form-check-input" type="checkbox" name="onSale" value="1" id="flexCheckDefault3" checked>
				  <label class="form-check-label" for="flexCheckDefault3">판매</label>
				</div>
			</div>
		</div>
	
		<hr>
        <div class="mb-3 row">
			  <label for="" class="col-sm-2 col-form-label"><b>색상/사이즈 설정</b></label>
			  <label for="" class="col-sm-2 col-form-label"><b>색상</b></label>
			  <label for="" class="col-sm-2 col-form-label"><b>사이즈 목록</b></label>
		</div>
		
	        <div class="mb-3 row">
				<div class="col-sm-2">
			    	<button id="addRow" tabindex="-1" type="button" class="btn btn-outline-primary">+</button>
				</div>
				<div class="col-sm-2">
				      <input type="text" name="colorList[0]" class="form-control" placeholder="색상">
				</div>
				<div class="col-sm-4">
				      <input type="text" name="sizeList[0]" class="form-control" placeholder="ex)260,270,280 (쉼표로 구분)">
				</div>
			</div>  
		<div class="" id="newRow"></div> 

	 	<hr>    
        <div class="mb-3">            
		  <label for="exampleFormControlTextarea1" class="form-label"><b>상품 상세정보</b></label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" name="detail" rows="3">${productDTO.detail }</textarea>
		</div>
		<hr>  
		<div class="input-group mb-3">            
		  <label class="input-group-text" for="inputGroupFile01">상품 이미지</label>
		  <input type="file" class="form-control" id="attachment" name="attachment" multiple>
		</div>
		<hr>
		<b>대표 이미지 ▽</b> 
		   
		<div class="row row-cols-1 row-cols-md-6 g-6 mb-3 attachmentResult">
			  
		</div>      
		    
		<button type="submit" class="btn btn-primary">상품 수정</button>
		<button type="button" class="btn btn-secondary">목록으로</button>
		</div>   

	</form>
        </main>             
        </main> 
<script>
	const productId = ${productDTO.productId } 
	const pageIsRead = true;
</script>
<script src="/js/attachment.js"></script>
<script src="/js/admin-product-read.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>