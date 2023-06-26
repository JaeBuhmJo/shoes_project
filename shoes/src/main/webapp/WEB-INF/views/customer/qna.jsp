<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Modal -->
<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="w-100 pt-1 mb-5 text-right">
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<form action="" method="get" class="modal-content modal-body border-0 p-0">
			<div class="input-group mb-2">
				<input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
				<button type="submit" class="input-group-text bg-success text-light">
					<i class="fa fa-fw fa-search text-white"></i>
				</button>
			</div>
		</form>
	</div>
</div>



<section class="bg-success py-5">
	<div class="container">
		<div class="row align-items-center py-5">
			<div class="col-md-8 text-white">
				<h1>About Us</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			<div class="col-md-4">
				<img src="/assets/img/about-hero.svg" alt="About Hero">
			</div>
		</div>
	</div>
</section>
<!-- Close Banner -->

<!-- Start Section -->
<section class="container py-5">
	<div class="row text-center pt-5 pb-3">
		<div class="col-lg-6 m-auto">
			<h1 class="h1">Our Services</h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod Lorem ipsum dolor sit amet.</p>
		</div>
	</div>
	<div class="row">

		<div class="col-md-6 col-lg-3 pb-5">
			<div class="h-100 py-5 services-icon-wap shadow">
				<div class="h1 text-success text-center">
					<i class="fa fa-truck fa-lg"></i>
				</div>
				<h2 class="h5 mt-4 text-center">Delivery Services</h2>
			</div>
		</div>

		<div class="col-md-6 col-lg-3 pb-5">
			<div class="h-100 py-5 services-icon-wap shadow">
				<div class="h1 text-success text-center">
					<i class="fas fa-exchange-alt"></i>
				</div>
				<h2 class="h5 mt-4 text-center">Shipping & Return</h2>
			</div>
		</div>

		<div class="col-md-6 col-lg-3 pb-5">
			<div class="h-100 py-5 services-icon-wap shadow">
				<div class="h1 text-success text-center">
					<i class="fa fa-percent"></i>
				</div>
				<h2 class="h5 mt-4 text-center">Promotion</h2>
			</div>
		</div>

		<div class="col-md-6 col-lg-3 pb-5">
			<div class="h-100 py-5 services-icon-wap shadow">
				<div class="h1 text-success text-center">
					<i class="fa fa-user"></i>
				</div>
				<h2 class="h5 mt-4 text-center">24 Hours Service</h2>
			</div>
		</div>
	</div>
</section>
<!-- End Section -->
<div class="col-lg-10 text-center m-auto">
<div class="col-lg-6 m-auto">
	<h1 class="h1">Best FAQ</h1>

</div>
<div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        교환 및 환불
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">상품 구매 시 교환 및 환불 불가이오니 이점 유의 바랍니다</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        자주하는 질문
        	
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
    
      <div class="accordion-body">
    <ul>
        		<li></li>
        		<li></li>
        		<li></li>
        		<li></li>
        	</ul>  		
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Accordion Item #3
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
    </div>
  </div>
</div>


<table class="table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">작성자</th>
			<th scope="col">제목</th>
			<th scope="col">문의 등록일</th>

		</tr>
	</thead>
	<tbody>
		<c:forEach var="qna" items="${list}">
			<tr>
				<th scope="row">${qna.qnaId}</th>

				<td>${qna.memberId}</td>
				<td><a href="${qna.qnaId}" class="qna">${qna.title}</a></td>
				<td>${qna.questionDate} </td>
			</tr>
		</c:forEach>
	</tbody>
</table> 
<!-- 페이지 나누기 시작 -->
 <nav aria-label="...">
	<ul class="pagination justify-content-center">

		<c:if test="${qnaPage.prev}">
			<li class="page-item"><a class="page-link" href="${qnaPage.startPage-1} ">Previous</a></li>
		</c:if>

		<c:forEach begin="${qnaPage.startPage}" end="${qnaPage.endPage}" var="idx">
			<li class="page-item ${qnaPage.cri.page==idx?'active':'' }"><a class="page-link" href="${idx}">${idx}</a></li>
		</c:forEach>

		<c:if test="${qnaPage.next}">
			<li class="page-item"><a class="page-link" href="${qnaPage.endPage+1} ">Next</a></li>
		</c:if>
	</ul>
</nav> 
<!-- 페이지 나누기 종료 -->
</div>
<!-- Start Brands -->
<section class="bg-light py-5">
	<div class="container my-4">
		<div class="row text-center py-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1">Our Brands</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod Lorem ipsum dolor sit amet.</p>
			</div>
			<div class="col-lg-9 m-auto tempaltemo-carousel">
				<div class="row d-flex flex-row">
					<!--Controls-->
					<div class="col-1 align-self-center">
						<a class="h1" href="#templatemo-slide-brand" role="button" data-bs-slide="prev"> <i class="text-light fas fa-chevron-left"></i>
						</a>
					</div>
					<!--End Controls-->

					<!--Carousel Wrapper-->
					<div class="col">
						<div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="templatemo-slide-brand" data-bs-ride="carousel">
							<!--Slides-->
							<div class="carousel-inner product-links-wap" role="listbox">

								<!--First slide-->
								<div class="carousel-item active">
									<div class="row">
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_01.png" alt="Brand Logo"></a>
										</div>
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_02.png" alt="Brand Logo"></a>
										</div>
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_03.png" alt="Brand Logo"></a>
										</div>
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_04.png" alt="Brand Logo"></a>
										</div>
									</div>
								</div>
								<!--End First slide-->

								<!--Second slide-->
								<div class="carousel-item">
									<div class="row">
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_01.png" alt="Brand Logo"></a>
										</div>
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_02.png" alt="Brand Logo"></a>
										</div>
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_03.png" alt="Brand Logo"></a>
										</div>
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_04.png" alt="Brand Logo"></a>
										</div>
									</div>
								</div>
								<!--End Second slide-->

								<!--Third slide-->
								<div class="carousel-item">
									<div class="row">
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_01.png" alt="Brand Logo"></a>
										</div>
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_02.png" alt="Brand Logo"></a>
										</div>
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_03.png" alt="Brand Logo"></a>
										</div>
										<div class="col-3 p-md-5">
											<a href="#"><img class="img-fluid brand-img" src="/assets/img/brand_04.png" alt="Brand Logo"></a>
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
						<a class="h1" href="#templatemo-slide-brand" role="button" data-bs-slide="next"> <i class="text-light fas fa-chevron-right"></i>
						</a>
					</div>
					<!--End Controls-->
				</div>
			</div>
		</div>
	</div>
</section>
<!--End Brands-->

<%--페이지 나누기 링크 처리를 위한 폼 --%>
<form action="/member/qna" id="operForm">
	<%-- QnaPageDTO.cri.page 가능 --%>
	<input type="hidden" name="page" value="${cri.page}" />
	<input type="hidden" name="listAmount" value="${cri.listAmount}" />
<%-- 	<input type="hidden" name="keyword" value="${cri.keyword}" /> --%>
</form>



<script>
const path= '${pageContext.request.requestURI}';
	const result = '${result}';
</script>
<script src="/poweqnajs/qna.js"> </script>

<%@include file="../include/footer.jsp"%>


