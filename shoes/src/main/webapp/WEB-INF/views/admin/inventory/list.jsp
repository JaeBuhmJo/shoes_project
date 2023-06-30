<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/adminheader.jsp" %>
      <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-5 py-2">
                <h3 class="mt-4 pb-2">재고 현황 조회</h3>
                		<hr />
			<div class="form-inline mb-3">
			    <form action="" id="searchForm">
			        <div class="row align-items-center">
			            <label for="formControlInput1" class="col-auto col-form-label"><b>재고 검색 :</b></label>
			            <div class="form-group col-auto">
			                <select name="searchType" id="type" class="form-control">
								<option value="" ${inventoryCri.searchType == ""? 'selected':'' }>전체 항목</option>
								<option value="quantity" ${inventoryCri.searchType == 'quantity'? 'selected':'' }>잔여 재고</option>
								<option value="productName" ${inventoryCri.searchType == 'productName'? 'selected':'' }>상품명</option>
								<option value="inventoryId" ${inventoryCri.searchType == 'inventoryId'? 'selected':'' }>재고 코드</option>
								<option value="productId" ${inventoryCri.searchType == 'Id'? 'selected':'' }>상품 코드</option>
			                </select>
			            </div>
			            <div class="form-group col-auto">
			                <input type="text" name="keyword" id="keyword" class="form-control" value="${inventoryCri.searchType == ''? '':inventoryCri.keyword }"/>
			            </div>
			            <div class="form-group col-auto">
			                <button type="submit" class="btn btn-outline-success">검색</button>
			            </div>
			            <div class="form-check col-auto">
			                <input class="form-check-input" type="checkbox" name="discontinued" id="discontinued" ${inventoryCri.discontinued?'checked':'' }>
			                <label class="form-check-label" for="discontinued">단종 재고 보기</label>
			            </div>
			        </div>
			    </form>
			</div>
			<hr />
			
			<!-- 이거 테이블로 하자 -->
		<div class="overflow-auto inventory-list-div">
			<table class="table table-sm table-hover table-striped table-bordered inventory-list-table">
			  <thead class="table-light text-center">
			    <tr>
			      <th scope="col">상품 코드</th>
			      <th scope="col">상품명</th> 
			      <th scope="col">색상</th>
			      <th scope="col">사이즈</th>
			      <th scope="col">재고 수량</th>
			      <th scope="col">재고 코드</th>
			      <th scope="col">가격</th>
			      <th scope="col">누적 판매량</th> 
			      <th scope="col">판매중 여부</th>    
			      <th scope="col">최초 입고일시</th> 
			    </tr>  
			  </thead> 
			  <tbody class="table-group-divider overflow-auto inventory-list-table">
			  	<c:forEach items="${list}" var="product"> 
				  	<c:forEach items="${product.inventories}" var="inventory"> 
					    <tr>
					      <th scope="row" ><a href="/admin/inventory/read/${product.productId}" class="text-decoration-none"> ${product.productId }</a></th>
					      <th ><a href="/admin/inventory/read/${product.productId}" class="text-decoration-none">${product.productName}</a></th>
					      <td class="text-end">${inventory.productColor}</td>
					      <td class="text-end">${inventory.productSize}</td>
					      <td class="text-end">${inventory.quantity}</td>
					      <th class="text-end">${inventory.inventoryId}</th>
					      <td class="text-end">${product.price}</td>
					      <td class="text-end">${product.soldCount}</td>
					      <td class="text-end">${product.onSale?'판매중':'중단'}</td>
					      <td class="text-end">${inventory.stockedDate}</td>
					    </tr>
				    </c:forEach>
			    </c:forEach> 
				</tbody> 
			</table>
		</div>
        </main>
<script src="/js/admin-inventory-list.js"></script>
<%@ include file="../../include/adminfooter.jsp" %>