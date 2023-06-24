<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/adminheader.jsp" %>
      <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-5 py-2">
                <h3 class="mt-4 pb-2">상품 목록 조회</h3>

	<button type="button" class="btn btn-success">상품 신규 등록 </button> 
		<hr />
		<div class="form-inline mb-3">
		    <form action="" id="searchForm">
		        <div class="row align-items-center">
		            <label for="formControlInput1" class="col-auto col-form-label"><b>상품 검색 :</b></label>
		            <div class="form-group col-auto">
		                <select name="searchType" id="type" class="form-control">
		                    <option value="productName" ${productCri.searchType == 'productName'||productCri.searchType == ''? 'selected':'' }>상품명</option>
		                    <option value="productId" ${productCri.searchType == 'productId'? 'selected':'' }>상품코드</option>
		                </select>
		            </div>
		            <div class="form-group col-auto">
		                <input type="text" name="keyword" id="keyword" class="form-control" value="${productCri.searchType == ''? '':productCri.keyword }"/>
		            </div>
		            <div class="form-group col-auto">
		                <button type="submit" class="btn btn-outline-success">검색</button>
		            </div>
		            <div class="form-check col-auto">
		                <input class="form-check-input" type="checkbox" name="discontinued" id="discontinued" ${productCri.discontinued?'checked':'' }>
		                <label class="form-check-label" for="discontinued">단종 상품 보기</label>
		            </div>
		        </div>
		    </form>
		</div>
			<hr />
			<!-- 이거 테이블로 하자 --> 
		<div class="overflow-auto product-list-table">
			<table class="table table-sm table-hover table-striped table-bordered">
			  <thead class="table-light">
			    <tr>
			      <th scope="col">상품 코드</th>
			      <th scope="col">상품명</th> 
			      <th scope="col">카테고리</th> 
			      <th scope="col">브랜드</th> 
			      <th scope="col">가격</th>
			      <th scope="col">제조국</th> 
			      <th scope="col">제조연도</th>
			      <th scope="col">판매중 여부</th>
			      <th scope="col">누적 판매량</th>
			      <th scope="col">판매등록일시</th> 
			      <th scope="col">정보수정일시</th> 
			    </tr>  
			  </thead>  
			  <tbody class="table-group-divider overflow-auto product-list-table">
			  	<c:forEach items="${list}" var="item"> 
				    <tr>
				      <th scope="row"><a href="/admin/product/read/${item.productId}" class="text-decoration-none"> ${item.productId }</a></th>
				      <th ><a href="/admin/product/read/${item.productId}" class="text-decoration-none"> ${item.productName }</a></td>
				      <td class="text-end">${item.category }</td>
				      <td class="text-end">${item.brand }</td>
				      <td class="text-end">${item.price}</td>
				      <td class="text-end">${item.productCountry}</td>
				      <td class="text-end">${item.productYear}</td>
				      <td class="text-end">${item.onSale?'판매중':'중단'}</td>
				      <td class="text-end">${item.soldCount}</td> 
				      <td class="text-end">${item.registeredDate }</td>
				      <td class="text-end">${item.modifiedDate}</td>
				    </tr>
			    </c:forEach>
				</tbody>
			</table>
		</div>
        </main>
<form action="" id="operForm">
	<input type="hidden" name="searchType" value="${productCri.searchType}" /> 
	<input type="hidden" name="keyword" value="${productCri.searchType}" />
</form>
<script src="/js/admin-product-list.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>