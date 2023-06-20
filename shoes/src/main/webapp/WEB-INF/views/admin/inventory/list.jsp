<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/adminheader.jsp" %>
      <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h3 class="mt-4 pb-2">재고 현황 조회</h3>
			<div class="d-flex">
				<div class="flex-grow-1 pb-2">
					<form action="" id="searchForm">
						<div class="form-row row">  
								<label for="type" > <b>재고 검색 :</b></label>
							<div class="form-group col-2">
								<select name="searchType" id="type" class="form-control">
									<option value="" ${inventoryCri.searchType == ""? 'selected':'' }>전체</option>
									<option value="productId" ${inventoryCri.searchType == 'productId'? 'selected':'' }>상품코드</option>
									<option value="productName" ${inventoryCri.searchType == 'productName'? 'selected':'' }>상품명</option>
								</select>
							</div>
							<div class="form-group col-3">
								<input type="text" name="keyword" id="keyword" class="form-control" value="${inventoryCri.searchType == ''? '':inventoryCri.keyword }"/>
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
			      <th scope="col">재고 코드</th>
			      <th scope="col">상품명</th> 
			      <th scope="col">사이즈</th>
			      <th scope="col">재고 수량</th>
			      <th scope="col">판매중 여부</th>
			      <th scope="col">누적 판매량</th>
			      <th scope="col">최초 입고일</th> 
			      <th scope="col">가격</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider overflow-auto product-list-table">
			  	<c:forEach items="${list}" var="product"> 
				  	<c:forEach items="${product.inventories}" var="inven"> 
					    <tr>
					      <th scope="row"><a href="/admin/inventory/read/${product.productId}"> ${product.productId }</a></th>
					      <td>${inven.inventoryId}</td>
					      <td>${product.productName}</td>
					      <td>${inven.productSize}</td>
					      <td>${inven.quantity}</td>
					      <td>${product.onSale?'판매중':'중단'}</td>
					      <td>${product.soldCount}</td>
					      <td>${inven.stockedDate}</td>
					      <td>${product.price}</td>
					    </tr>
				    </c:forEach>
			    </c:forEach>
				</tbody>
			</table>
		</div>
        </main>

<script src="/js/admin-product-list.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>