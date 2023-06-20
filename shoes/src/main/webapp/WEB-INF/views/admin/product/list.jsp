<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/adminheader.jsp" %>
      <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h3 class="mt-4 pb-2">상품 목록 조회</h3>

			<button type="button" class="btn btn-success">상품 신규 등록 </button>
			<div class="d-flex">
				<div class="flex-grow-1 pb-2">
					<form action="" id="searchForm">
						<div class="form-row row">  
								<label for="type" > <b>상품 검색 :</b></label>
							<div class="form-group col-2">
								<select name="searchType" id="type" class="form-control">
									<option value="" ${productCri.searchType == ""? 'selected':'' }>전체</option>
									<option value="productId" ${productCri.searchType == 'productId'? 'selected':'' }>상품코드</option>
									<option value="productName" ${productCri.searchType == 'productName'? 'selected':'' }>상품명</option>
								</select>
							</div>
							<div class="form-group col-3">
								<input type="text" name="keyword" id="keyword" class="form-control" value="${productCri.searchType == ''? '':productCri.keyword }"/>
							</div>
							<div class="form-group col">
								<button type="submit" class="btn btn-info">검색</button>
							</div>
						</div>
						</form>
					</form>
				</div>
			</div>
			
			<!-- 이거 테이블로 하자 -->
		<div class="overflow-auto product-list-table">
			<table class="table table-sm table-hover table-striped-columns table-bordered">
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
				      <th scope="row"><a href="/admin/product/read/${item.productId}"> ${item.productId }</a></th>
				      <td >${item.productName }</td>
				      <td>${item.category }</td>
				      <td>${item.brand }</td>
				      <td>${item.price}</td>
				      <td>${item.productCountry}</td>
				      <td>${item.productYear}</td>
				      <td>${item.onSale?'판매중':'중단'}</td>
				      <td>${item.soldCount}</td>
				      <td>${item.registeredDate }</td>
				      <td>${item.modifiedDate}</td>
				    </tr>
			    </c:forEach>
				</tbody>
			</table>
		</div>
        </main>

<script src="/js/admin-product-list.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>