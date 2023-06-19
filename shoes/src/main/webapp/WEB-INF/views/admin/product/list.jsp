<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/adminheader.jsp" %>
      <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h3 class="mt-4 pb-2">상품 등록/수정</h3>

			<button type="button" class="btn btn-success">상품 신규 등록 </button>
			<div class="d-flex">
				<div class="flex-grow-1 pb-2">
					<form action="" id="searchForm">
						<div class="form-row row">  
								<label for="type" > <b>상품 검색 :</b></label>
							<div class="form-group col-2">
								<select name="searchType" id="type" class="form-control" value="${productListCri.searchType}">
									<option value="" ${productListCri.searchType == ""? 'selected':'' }>전체</option>
									<option value="productId" ${productListCri.searchType == 'productId'? 'selected':'' }>상품코드</option>
									<option value="productName" ${productListCri.searchType == 'productName'? 'selected':'' }>상품명</option>
								</select>
							</div>
							<div class="form-group col-3">
								<input type="text" name="keyword" id="keyword" class="form-control" value="${productListCri.searchType == ''? '':productListCri.keyword }"/>
							</div>
							<div class="form-group col">
								<button type="submit" class="btn btn-info">검색</button>
							</div>
						</div>
						</form>
					</form>
				</div>
			</div>

		<!-- list start -->
		<c:forEach items="${list}" var="item"> 
           <div class="list-group">
			  <a href="#" class="list-group-item list-group-item-action" aria-current="true">
			    <div class="d-flex w-100 justify-content-between">
			      <h5 class="mb-1">${item.productName }</h5>
			      <small>${item.onSale?'판매중':'판매 중단' }</small>
			    </div>
			    <small>사이즈 목록</small>
			  </a>
		</c:forEach>
			<!-- list end -->
			
        </main>

<script src="/js/admin-product-list.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>