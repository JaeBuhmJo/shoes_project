<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminheader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <div id="layoutSidenav_content">
        <main>
            <div class="container py-3">
                <h3 class="mt-4">재고 조회/수정</h3>
     <form action="/admin/inventory/modify" method="post">
     <hr/>
        <div class="mb-3 row">
			<label for="exampleFormControlInput8" class="col-sm-2 col-form-label"><b>상품코드</b></label>
			<div class="col-sm-2">
			  <input type="text" class="form-control form-readonly" id="exampleFormControlInput8" name="productId" value="${productDTO.productId }" readonly>
			</div>
       		<button type="button" class="btn btn-success col-sm-1">상품 수정</button>
		</div>
     <hr/>
        <div class="mb-3 row">
			<label for="exampleFormControlInput1" class="col-sm-2 col-form-label"><b>상품명</b></label>
			<div class="col-sm-6">
			  <input type="text" class="form-control form-readonly" id="exampleFormControlInput1" name="productName" value="${productDTO.productName }" readonly>
			</div>
		</div>
     <hr/>
		<hr>   

	        <div class="mb-3 row">
	        	<label for="" class="col-sm-2 col-form-label"><b>재고 수량 변경</b></label>
	        	<div class="col-sm-6">
			 	<table class="table table-hover table-bordered table-sm table-striped">
				  <thead>
				    <tr>
				      <th scope="col" class="col-sm-2 text-center">색상</th>
				      <th scope="col" class="col-sm-2 text-center">사이즈</th>
				      <th scope="col" class="col-sm-2 text-center">재고 수량</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider"> 
				  	<c:forEach items="${inventoryList}" var="inventory" varStatus="status">
					<tr>
				        <th scope="row" class="text-center align-middle" >${inventory.productColor}</th>
					    <td class='text-center align-middle'>${inventory.productSize}</td>
					    <td><input type="text" class="form-control form-control-sm text-center align-middle" name="quantityList[${status.count-1}]" value="${inventory.quantity}" ${inventory.discontinued?'disabled':'' }/></td>
				    </tr>
					    <input type="hidden" name="colorList[${status.count-1}]" value="${inventory.productColor}"/>
					    <input type="hidden" name="sizeList[${status.count-1}]" value="${inventory.productSize}"/>
				  	</c:forEach> 
				  </tbody> 
				</table>  
				</div> 
				</div>
		<div class="form-check form-switch">
		  <input class="form-check-input" type="checkbox" name="onSale"  role="switch" id="flexSwitchCheckChecked" value="1" ${productDTO.onSale?'checked':'' }>
		  <label class="form-check-label" for="flexSwitchCheckChecked" >판매하기</label>
		</div>

		<hr>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button type="submit" class="btn btn-primary">재고 수정</button>
		<button type="button" class="btn btn-secondary">목록으로</button>
		<hr>
     	<div class="row">
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput2" class="form-label"><b>카테고리</b></label>
			  <input type="text" class="form-control form-readonly" id="exampleFormControlInput2" name="category" value="${productDTO.category }"  readonly>
			</div>
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput3" class="form-label"><b>브랜드</b></label>
			  <input type="text" class="form-control form-readonly" id="exampleFormControlInput3" name="brand" value="${productDTO.brand }"  readonly>
			</div>
		</div>
		<div class="row">
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput4" class="form-label"><b>판매 가격</b></label>
			  <input type="text" class="form-control form-readonly" id="exampleFormControlInput4" name="price" value="${productDTO.price }"  readonly>
			</div>
		</div>
		<div class="row">
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput6" class="form-label"><b>제조 국가명</b></label>
			  <input type="text" class="form-control form-readonly" id="exampleFormControlInput6" name="productCountry" value="${productDTO.productCountry }"  readonly>
			</div>
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput7" class="form-label"><b>제조 연도</b></label>
			  <input type="number" class="form-control form-readonly" id="exampleFormControlInput7" name="productYear" value="${productDTO.productYear }"  readonly>
			</div>
		</div>
		  <label for="exampleFormControlTextarea1" class="form-label"><b>상품 상세정보</b></label>
		  <textarea class="form-control form-readonly" id="exampleFormControlTextarea1" name="detail" rows="3"  readonly>${productDTO.detail }</textarea>
			<input class="" type="hidden" name="forMen" value="${productDTO.forMen?'true':'false' }" id="flexCheckDefault1" >
			<input class="" type="hidden" name="forWomen" value="${productDTO.forWomen?'true':'false' }" id="flexCheckDefault2" >
		</form>
        </main>
        </main>
        <form action="/inventory/list" id="operForm">
			<input type="hidden" name="searchType" value="${inventoryCri.searchType}" /> 
			<input type="hidden" name="keyword" value="${inventoryCri.keyword}" />
			<input type="hidden" name="discontinued" value="${inventoryCri.discontinued}" />
		</form>
<script > 
	const productId = ${productDTO.productId }
	let colorCount = 0
</script>
<script src="/js/admin-inventory-read.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>