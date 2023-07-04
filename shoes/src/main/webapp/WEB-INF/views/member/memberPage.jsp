<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

	<!-- Start Content -->
	<security:authentication property="principal.memberDTO"
		var="userDetails" />
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">${userDetails.memberId }님의 주문목록</h1>
		</div>
	</div>

	<div class="container py-5">
		
		<div class="row">
			<%@ include file="../include/membersidebar.jsp"%>





			<div class="col-lg-9">
			<div class="mx-4 my-4">
			
			
			<div class="d-flex">
			
			
	<!-- 검색부분  -->
	    <div class="d-flex mb-0">
		    <div class="">
				<div class="">
					<form class="d-inline-flex" action="" id="searchForm">
					<%-- 검색 버튼 클릭 시 검색 결과는 무조건 1page 부터 봐야 하기 때문에 --%>
					<input type="hidden" name="page" value="1" /> 
				    <input type="hidden" name="amount" value="${cri.listAmount}" />
						<div class="">
							<select name="searchType" id="searchType" class="form-control">
								<option value=""   <c:out value="${cri.searchType == ''?'selected':''}"/>>---------</option>
								<option value="P"  <c:out value="${cri.searchType == 'P'?'selected':''}"/>>상품명</option>
								<option value="D"  <c:out value="${cri.searchType == 'D'?'selected':''}"/>>주문날짜</option>
								<option value="PD" <c:out value="${cri.searchType == 'PD'?'selected':''}"/>>상품명 or 주문날짜</option> 
							</select>
						</div>
						<div class="">
							<input type="text" name="keyword" id="keyword" class="form-control" value="${cri.keyword}"/>
						</div>
						<div class="">
							<button type="submit" class="btn btn-info">검색</button>
						</div>
					</form>
				</div>
		    </div>
	<!-- 검색 종료 -->
			<!-- 페이지에 보이는 갯수 설정 -->
				<div class="ms-5">
					<select name="amount" id="amount" class="form-control">
						<%-- pageDTO.cri.amount 가능 --%>
						<option value="10"
							<c:out value="${cri.listAmount == 10?'selected':''}"/>>10</option>
						<option value="20"
							<c:out value="${cri.listAmount == 20?'selected':''}"/>>20</option>
						<option value="30"
							<c:out value="${cri.listAmount == 30?'selected':''}"/>>30</option>
						<option value="40"
							<c:out value="${cri.listAmount == 40?'selected':''}"/>>40</option>
					</select>
				</div>
			</div>
			
			
			
	    </div>
			
			
			
			
			
			
			

				<!-- 주문 목록 시작 -->
				
				<div class="row" style="text-align: center;">
					<div class="col-md-12">
						<table class="table table-striped table-bordered table-hover"
							style="margin: 0 auto;">
							<thead>
								<tr>
									<th scope="col">상품사진</th>
									<th scope="col">상품내용</th>
									<th scope="col">주문일자</th>
									<th scope="col">주문금액</th>
									<th scope="col">주문수량</th>
									<th scope="col">주문리뷰</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${orderList}">
									<tr>
										<th scope="row"><img src="/attachment/file?fileName=${dto.filePath}" /></th>
										<td>브랜드 : ${dto.brand}<br>상품명 : ${dto.productName}<br>색상 : ${dto.productColor}</td>
										<td><br><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.purchaseDate}" /></td>
										<td><br>${dto.price}원</td>
										<td><br>${dto.purchaseAmount}개</td>
										<td><br><a href="/shoes/review?productId=${dto.productId}">상품리뷰</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- 페이지 나누기 시작 -->
					<nav aria-label="...">
						<ul class="pagination justify-content-center">
							<c:if test="${pageDTO.prev}">
								<li class="page-item"><a class="page-link"
									href="${pageDTO.startPage-1}">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageDTO.startPage}" end="${pageDTO.endPage}"
								var="idx">

								<li class="page-item ${pageDTO.cri.page==idx?'active':'' }"><a
									class="page-link" href="${idx}">${idx}</a></li>

							</c:forEach>


							<c:if test="${pageDTO.next}">
								<li class="page-item"><a class="page-link"
									href="${pageDTO.endPage+1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
					<!-- 페이지 나누기 종료  -->
				</div>
			</div>
			</div>
		</div>
	</div>

	<!-- 페이지 나누기 링크 처리를 위한 폼  -->
	<form action="/member/memberPage" id="operForm">
		<%-- pageDTO.cri.page 가능 --%>
		<input type="hidden" name="page" value="${cri.page}" /> <input
			type="hidden" name="listAmount" value="${cri.listAmount}" />
	</form>

	<!-- End Content -->

	<!-- Start Brands -->           
	<section class="bg-light py-5">
		<div class="container my-4">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">Our Brands</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod Lorem ipsum dolor sit amet.</p>
				</div>
				<div class="col-lg-9 m-auto tempaltemo-carousel">
					<div class="row d-flex flex-row">
						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#multi-item-example" role="button"
								data-bs-slide="prev"> <i
								class="text-light fas fa-chevron-left"></i>
							</a>
						</div>
						<!--End Controls-->

						<!--Carousel Wrapper-->
						<div class="col">
							<div class="carousel slide carousel-multi-item pt-2 pt-md-0"
								id="multi-item-example" data-bs-ride="carousel">
								<!--Slides-->
								<div class="carousel-inner product-links-wap" role="listbox">

									<!--First slide-->
									<div class="carousel-item active">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End First slide-->

									<!--Second slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End Second slide-->

									<!--Third slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="/assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End Third slide-->

								</div>
								<!--End Slides-->
							</div>
						</div>
						<!--End Carousel Wrapper-->

						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#multi-item-example" role="button"
								data-bs-slide="next"> <i
								class="text-light fas fa-chevron-right"></i>
							</a>
						</div>
						<!--End Controls-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--End Brands-->

	<!-- Start Script -->
	<script src="/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/templatemo.js"></script>
	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/memberPage.js"></script>
	<!-- End Script -->

	
<%@ include file="../include/footer.jsp"%>
