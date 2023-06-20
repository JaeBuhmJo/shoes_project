<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminheader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h3 class="mt-4">재고 조회/수정</h3>
     <form action="/admin/inventory/modify" method="post">
     	<div class="row">
	        <div class="mb-3 col-1">
			  <label for="exampleFormControlInput8" class="form-label"><b>상품코드</b></label>
			  <input type="text" class="form-control form-readonly" id="exampleFormControlInput8" name="productId" value="${productDTO.productId }" readonly>
			</div>
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput1" class="form-label"><b>상품명</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput1" name="productName" value="${productDTO.productName }" required>
			</div>
     	</div>
        <button type="button" class="btn btn-success">상품 수정으로</button>
		<hr/>
		<b>사이즈별 재고 수량 수정</b>
		
		<div class="">
			<c:forEach var="size" begin="220" end="290" step="10">
				<c:set var="currentQuantity" value="0"/>
						<c:forEach items="${inventoryList}" var="list">
							<c:if test="${list.productSize==size}">
								<c:set var="currentQuantity" value="${list.quantity }"/>
							</c:if>
						</c:forEach>
				<div class="input-group size-width m-1">
					<span class="input-group-text" id="basic-addon1">${size }</span>
					<input type="text" class="form-control text-end" name="quantity" value="${currentQuantity }" maxlength="4" aria-label="Username" aria-describedby="basic-addon1" required>
				</div>
			</c:forEach>
		</div>
		<hr>
		<div class="form-check form-switch">
		  <input class="form-check-input" type="checkbox" name="onSale"  role="switch" id="flexSwitchCheckChecked" value="1" ${productDTO.onSale?'checked':'' }>
		  <label class="form-check-label" for="flexSwitchCheckChecked" >판매하기</label>
		</div>
		<hr>
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
		  <input type="hidden" class="form-control" id="inputGroupFile01" name="productImageOne" value="${productDTO.productImageOne }">
		  <input type="hidden" class="form-control" id="inputGroupFile02" name="productImageTwo">
		  <input type="hidden" class="form-control" id="inputGroupFile03" name="productImageThree">
		  <input type="hidden" class="form-control" id="inputGroupFile04" name="productImageFour">
		</form>
        </main>              
        </main> 
<script >
	const productId = ${productDTO.productId }
</script>
<script src="/js/admin-inventory-read.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>