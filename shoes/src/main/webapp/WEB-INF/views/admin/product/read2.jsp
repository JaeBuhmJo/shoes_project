<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminheader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <div id="layoutSidenav_content">
        <main>
            <div class="container py-1">
                <h3 class="mt-4">상품 조회/수정</h3> 
     <form action="/admin/product/modify" method="post" id="modifyForm">
     	<div class="row">
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput1" class="form-label"><b>상품명</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput1" name="productName" value="${productDTO.productName }" required>
			</div>
	        <div class="mb-3 col-3">    
			  <label for="exampleFormControlInput8" class="form-label"><b>상품코드</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput8" name="productId" value="${productDTO.productId }" readonly>
			</div>
     	</div>
     	<div class="row">
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput2" class="form-label"><b>카테고리</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput2" name="category" value="${productDTO.category }" required>
			</div>
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput3" class="form-label"><b>브랜드</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput3" name="brand" value="${productDTO.brand }" required>
			</div>
		</div>
		<div class="row">
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput4" class="form-label"><b>판매 가격</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput4" name="price" value="${productDTO.price }" required>
			</div>
		</div>
		<div class="row">
	        <div class="mb-3 col">
			  <label for="exampleFormControlInput6" class="form-label"><b>제조 국가명</b></label>
			  <input type="text" class="form-control" id="exampleFormControlInput6" name="productCountry" value="${productDTO.productCountry }" required>
			</div>
			<div class="mb-3 col">
			  <label for="exampleFormControlInput7" class="form-label"><b>제조 연도</b></label>
			  <input type="number" class="form-control" id="exampleFormControlInput7" name="productYear" value="${productDTO.productYear }" required>
			</div>
		</div>
        <div class="form-check form-switch">
		  <input class="form-check-input" type="checkbox" name="onSale"  role="switch" id="flexSwitchCheckChecked" value="1" checked>
		  <label class="form-check-label" for="flexSwitchCheckChecked" >판매 여부</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="forMen" value="1" id="flexCheckDefault1" ${productDTO.forMen?'checked':''}>
		  <label class="form-check-label" for="flexCheckDefault1">남성화</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="forWomen" value="1" id="flexCheckDefault2" ${productDTO.forWomen?'checked':''}>
		  <label class="form-check-label" for="flexCheckDefault2">여성화</label>
		</div>
		<hr>
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
			<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label"><b>상품 상세정보</b></label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" name="detail" rows="3">${productDTO.detail }</textarea>
		</div>
		<hr/>
		
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
	</form>
        </main>              
        </main> 
<script>
	const productId = ${productDTO.productId } 
</script>
<script src="/js/attachment.js"></script>
<script src="/js/admin-product-read.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>