<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminheader.jsp" %>
      <div id="layoutSidenav_content">
        <main>
            <div class="container py-3">
                <h3 class="mt-4">상품 신규 등록</h3>
     <form action="" method="post" id="registerForm">
     <hr/>
        <div class="mb-3 row">
		<label for="listGroup1" class="col-sm-2"><b>카테고리</b></label>
			<div class="col-sm-2">
		        <ul class="list-group" id="listGroup1" >
				  <li class="list-group-item ">
				    <input class="form-check-input me-1" type="radio" name="category" value="운동화" id="firstRadio" checked>
				    <label class="form-check-label" for="firstRadio">운동화</label>
				  </li>
				  <li class="list-group-item ">
				    <input class="form-check-input me-1" type="radio" name="category" value="구두" id="secondRadio">
				    <label class="form-check-label" for="secondRadio">구두</label>
				  </li>
				  <li class="list-group-item"> 
				    <input class="form-check-input me-1" type="radio" name="category" value="슬리퍼" id="thirdRadio">
				    <label class="form-check-label" for="thirdRadio">슬리퍼</label>
				  </li>
				</ul>
			</div>
		</div>
     <hr/>
        <div class="mb-3 row">
			<label for="formControlInput1" class="col-sm-2 col-form-label"><b>상품명</b></label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="formControlInput1" name="productName" placeholder="진열할 상품 이름 입력" required>
			</div>
		</div>
     <hr/>
        <div class="mb-3 row">
			<label for="formControlInput3" class="col-sm-2 col-form-label"><b>브랜드</b></label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="formControlInput3" name="brand" placeholder="ex)나이키, 크록스" required>
			</div>
		</div>
     <hr/>
        <div class="mb-3 row">
			  <label for="price" class="col-sm-2 col-form-label"><b>판매 가격</b></label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="price" name="price" placeholder="숫자만 입력" required>
			</div>
		</div>
     <hr/>
        <div class="mb-3 row">
			  <label for="formControlInput6" class="col-sm-2 col-form-label"><b>제조 국가명</b></label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="formControlInput6" name="productCountry" placeholder="제조 국가명 입력" required>
			</div>
		</div> 
     <hr/> 
        <div class="mb-3 row">
			  <label for="productYear" class="col-sm-2 col-form-label"><b>제조 연도</b></label>
			<div class="col-sm-2">
			  <input type="text" class="form-control" id="productYear" name="productYear" placeholder="연도만 기입" required>
			</div>
		</div>
		
     <hr/>
        <div class="mb-3 row">
			  <label for="" class="col-sm-2 col-form-label"><b>타겟 고객</b></label>
			<div class="col-sm-2">
				<div class="form-check col">
				  <input class="form-check-input" type="checkbox" name="forMen" value="1" id="flexCheckDefault1" checked>
				  <label class="form-check-label" for="flexCheckDefault1">남성</label>
				</div>
				<div class="form-check col">
				  <input class="form-check-input" type="checkbox" name="forWomen" value="1" id="flexCheckDefault2" checked>
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
			  <label for="" class="col-sm-2 col-form-label"><b>색상 (최대 10종)</b></label>
			  <label for="" class="col-sm-2 col-form-label"><b>사이즈 목록</b></label>
		</div>
	        <div class="mb-3 row">
				<div class="col-sm-2">
					<label for="addRow" class="text-secondary">입력 추가하기</label>
			    	<button id="addRow" tabindex="-1" type="button" class="btn btn-outline-primary"><i class="fa-solid fa-plus"></i></button>
				</div>
				<div class="col-sm-2">   
				      <input type="text" class="form-control colorList" placeholder="색상 *(필수 입력 필드)">
				</div> 
				<div class="col-sm-4">
				      <input type="text" class="form-control" placeholder="ex)260,270,280 (쉼표로 구분) *(필수 입력 필드)">
				</div>
			</div>       
		<div class="" id="newRow"></div> 
		<div class="d-grid gap-2 col-6 mx-auto">  
		  <button class="btn btn-success" tabindex="-1" type="button" >색상/사이즈 별 재고입력 생성</button>
		</div>
	 	<hr>   
	 	
        <div class="mb-3 row">
        	<label for="" class="col-sm-2 col-form-label"><b>재고 수량</b></label>
        	<div class="col-sm-6">
		 	<table class="table table-hover table-bordered table-sm">
			  <thead>
			    <tr>
			      <th scope="col" class="col-sm-2 text-center">색상</th>
			      <th scope="col" class="col-sm-2 text-center">사이즈</th>
			      <th scope="col" class="col-sm-2 text-center">재고 수량</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider"></tbody>
			</table> 
			</div>  
		</div> 
	 	   
	 	<hr>   
        <div class="mb-3">            
		  <label for="exampleFormControlTextarea1" class="form-label"><b>상품 상세정보</b></label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" name="detail" rows="3" ></textarea>
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
		      
		<button type="submit" class="btn btn-primary">상품 등록</button>
		<button type="button" class="btn btn-secondary">목록으로</button>
	</form>
		</div>   

        </main>
<script>
	let colorCount = 1;
	const pageIsRead = false;
</script>
<script src="/js/attachment.js"></script>
<script src="/js/admin-product-register.js"></script>
<script src="/js/color-size-tool.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>