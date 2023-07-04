<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<title>Zay Shop - Product Listing Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="/assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/assets/img/favicon.ico">

<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/templatemo.css">
<link rel="stylesheet" href="/assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="/assets/css/fontawesome.min.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
	<!-- Start Top Nav -->
	<nav
		class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block"
		id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100 d-flex justify-content-between">
				<div>
					<i class="fa fa-envelope mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="mailto:info@company.com">info@company.com</a> <i
						class="fa fa-phone mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="tel:010-020-0340">010-020-0340</a>
				</div>
				<div>
					<a class="text-light" href="https://fb.com/templatemo"
						target="_blank" rel="sponsored"><i
						class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a> <a
						class="text-light" href="https://www.instagram.com/"
						target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
					<a class="text-light" href="https://twitter.com/" target="_blank"><i
						class="fab fa-twitter fa-sm fa-fw me-2"></i></a> <a class="text-light"
						href="https://www.linkedin.com/" target="_blank"><i
						class="fab fa-linkedin fa-sm fa-fw"></i></a>
				</div>
			</div>
		</div>
	</nav>
	<!-- Close Top Nav -->


	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
		<div
			class="container d-flex justify-content-between align-items-center">

			<a class="navbar-brand text-success logo h1 align-self-center"
				href="index.html"> Zay </a>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div
				class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">
					<ul
						class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
						<li class="nav-item"><a class="nav-link" href="index.html">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="about.html">About</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="shop.html">Shop</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
						</li>
					</ul>
				</div>
				<div class="navbar align-self-center d-flex">
					<div
						class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
						<div class="input-group">
							<input type="text" class="form-control" id="inputMobileSearch"
								placeholder="Search ...">
							<div class="input-group-text">
								<i class="fa fa-fw fa-search"></i>
							</div>
						</div>
					</div>
					<a class="nav-icon d-none d-lg-inline" href="#"
						data-bs-toggle="modal" data-bs-target="#templatemo_search"> <i
						class="fa fa-fw fa-search text-dark mr-2"></i>
					</a> <a class="nav-icon position-relative text-decoration-none"
						href="#"> <i
						class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i> <span
						class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
					</a> <a class="nav-icon position-relative text-decoration-none"
						href="#"> <i class="fa fa-fw fa-user text-dark mr-3"></i> <span
						class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
					</a>
				</div>
			</div>

		</div>
	</nav>
	<!-- Close Header -->

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>                  
		</div>
	</div>

        

	<!-- Start Content -->
	<security:authentication property="principal.memberDTO"
		var="userDetails" />
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">${userDetails.memberId }주문목록페이지</h1>
			<p>조재범 프로젝트에 오신 걸 환영합니다.</p>
		</div>
	</div>

	<div class="container py-5">
		<div class="row">
			<div class="col-lg-2">
				<h1 class="h2 pb-4">회원 페이지</h1>
				<ul class="list-unstyled">
					<li class="pb-3"><a
						class="d-flex justify-content-between h3 text-decoration-none"
						style="color: black;" href="/member/memberDetail"> 회원상세 <i
							class="fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						style="color: black;" href="/member/modify"> 회원정보 수정 <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						style="color: black;" href="/shop/list"> <!-- /cart/cart?cart=1  -->
							장바구니 <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						style="color: black;" href="/member/memberPage?page=1&listAmount=10&searchType=&keyword="> 주문내역 <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						style="color: black;" href="/member/remove"> 회원탈퇴 <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						style="color: black;" href="#"> 구매후기 <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						style="color: black;" href="#"> 상품문의 <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a></li>
				</ul>
			</div>





			<div class="col-lg-9">
			
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


	<!-- Start Footer -->
	<footer class="bg-dark" id="tempaltemo_footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-success border-bottom pb-3 border-light logo">Zay
						Shop</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><i class="fas fa-map-marker-alt fa-fw"></i> 123
							Consectetur at ligula 10660</li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
						</li>
						<li><i class="fa fa-envelope fa-fw"></i> <a
							class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
						</li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none" href="#">Luxury</a></li>
						<li><a class="text-decoration-none" href="#">Sport Wear</a></li>
						<li><a class="text-decoration-none" href="#">Men's Shoes</a></li>
						<li><a class="text-decoration-none" href="#">Women's
								Shoes</a></li>
						<li><a class="text-decoration-none" href="#">Popular
								Dress</a></li>
						<li><a class="text-decoration-none" href="#">Gym
								Accessories</a></li>
						<li><a class="text-decoration-none" href="#">Sport Shoes</a></li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Further
						Info</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none" href="#">Home</a></li>
						<li><a class="text-decoration-none" href="#">About Us</a></li>
						<li><a class="text-decoration-none" href="#">Shop
								Locations</a></li>
						<li><a class="text-decoration-none" href="#">FAQs</a></li>
						<li><a class="text-decoration-none" href="#">Contact</a></li>
					</ul>
				</div>

			</div>

			<div class="row text-light mb-4">
				<div class="col-12 mb-3">
					<div class="w-100 my-3 border-top border-light"></div>
				</div>
				<div class="col-auto me-auto">
					<ul class="list-inline text-left footer-icons">
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="http://facebook.com/"><i
								class="fab fa-facebook-f fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://www.instagram.com/"><i
								class="fab fa-instagram fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://twitter.com/"><i
								class="fab fa-twitter fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://www.linkedin.com/"><i
								class="fab fa-linkedin fa-lg fa-fw"></i></a>
						</li>
					</ul>
				</div>
				<div class="col-auto">
					<label class="sr-only" for="subscribeEmail">Email address</label>
					<div class="input-group mb-2">
						<input type="text" class="form-control bg-dark border-light"
							id="subscribeEmail" placeholder="Email address">
						<div class="input-group-text btn-success text-light">Subscribe</div>
					</div>
				</div>
			</div>
		</div>

		<div class="w-100 bg-black py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left text-light">
							Copyright &copy; 2021 Company Name | Designed by <a
								rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- End Footer -->

	<!-- Start Script -->
	<script src="/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/templatemo.js"></script>
	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/memberPage.js"></script>
	<!-- End Script -->
</body>

</html>