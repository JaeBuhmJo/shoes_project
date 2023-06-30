<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>




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






<!-- Open Content -->
<section class="bg-light">
	<div class="container pb-5">
		<div class="row">
			<div class="col-lg-5 mt-5">
				<div class="card mb-3">
					<img class="powe-adidas1" src="/attachment/file?fileName=${filePathList[0]}" alt="Card image cap" id="product-detail">
				</div>
				<div class="row">
					
<div class="row">
                        <!--Start Controls-->
                        <div class="col-1 align-self-center">
                            <a href="#multi-item-example" role="button" data-bs-slide="prev">
                                <i class="text-dark fas fa-chevron-left"></i>
                                <span class="sr-only" style="text-decoration: none">◀</span>
                            </a>
                        </div>
                        <!--End Controls-->
                        <!--Start Carousel Wrapper-->
                        <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                            <!--Start Slides-->
                            <div class="carousel-inner product-links-wap" role="listbox">

                                <!--First slide-->
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/powe/adidas4.img" alt="Product Image 1">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/powe/adidas5.img" alt="Product Image 2">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/powe/adidas6.img" alt="Product Image 3">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/.First slide-->

                                <!--Second slide-->
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/powe/adidas7.img" alt="Product Image 4">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/powe/adidas2.img" alt="Product Image 5">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/powe/adidas3.img" alt="Product Image 6">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/.Second slide-->

                                <!--Third slide-->
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/powe/adidas2.img" alt="Product Image 7">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/powe/adidas6.img" alt="Product Image 8">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="/powe/adidas4.img" alt="Product Image 9">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/.Third slide-->
                            </div>
                            <!--End Slides-->
                        </div>
                        <!--End Carousel Wrapper-->
                        <!--Start Controls-->
                        <div class="col-1 align-self-center">
                            <a href="#multi-item-example" role="button" data-bs-slide="next">
                                <i class="text-dark fas fa-chevron-right"></i>
                                <span class="sr-only" >▶</span>
                            </a>
                        </div>
                        <!--End Controls-->
                    </div>
					<!--End Carousel Wrapper-->
				</div>
			</div>			
			<security:authorize access="isAuthenticated()">
				<security:authentication property="principal.memberDTO" 	var="userDetails" />
			</security:authorize>
			<!-- col end -->
			<div class="col-lg-7 mt-5" >
				<div class="card">
					<div class="card-body">
					<div id="productdetail">
					<form action="/shoes/detail" method="post" id="shoesForm">
					
						<h1 class="h2" id="productName" >${product.productName}</h1>
						<h3>${product.brand}</h3>
						<p class="h3 py-2" id="price" >
							가격: <span>${product.price}</span>  
						</p>
								<div id="averageRating">
									<span>${review.total}</span>
								</div>
								<!-- 상품 간략 정보 -->
	
							<h5>${product.detail}</h5>
										
																	
								<!-- 색상, 사이즈 -->								
								<div class="row pb-3">
								<div class="col d-grid">
									<button type="button" class="btn btn-success btn-lg"
									  onclick="location.href='/customer/question?productId=${product.productId}'">문의 하기</button>
								</div>
								<div class="col d-grid">
									<button type="submit" class="btn btn-success btn-lg" id="goCart"value="addtocard">Add To Cart</button>
								</div>
							</div>
						<ul class="list-inline pb-3" id="detailColor">
							<li class="list-inline-item">color :</li>
								 <select class="form-select" aria-label="" name="productColor" id="productColor">							
								<option selected>색상선택</option>
								
								<c:forEach var="cs" items="${color}">
									<option value="${cs.productColor}">${cs.productColor}</option>					
								</c:forEach>
							</select>
							</ul>
							  <ul class="list-inline pb-3" id="detailSize" style="display: none;">
									<li class="list-inline-item">size :</li>
									<select class="form-select" aria-label="" name="productSize" id="productSize">
										
									</select>
								</ul>  						
								<input class="form-control me-2 hiddenAmount" id="cartAmount" name="cartAmount" 
									type="search" placeholder="수량 입력" aria-label="Search" >	
																
																								
						    <input type="hidden" value="${list}" id="reviewList"/>
						    <input type="hidden" name="cartAmount" value="cart.cartAmount" id="cartAmount"/>
						    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						    <input type="hidden" name="memberId" value="${userDetails.memberId}" id="memberId"/>
<%-- 						    <input type="hidden" name="productId" value="${product.productId}" id="productId"/>
 --%>						    <input type="hidden" name="inventoryId" value="" id="inventoryId"/>
							
								</form>					
					</div>				
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Close Content -->



<!-- 캐러셀 섹션 러프 -->
<section class="py-5">
	<div class="container">							
					<div class="detail-list">
						<!--  상세 설명 및 주의 사항 등등 detail -->


						<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">


				<p class="fw-bold">상품 정보</p>
				<div class="row">
				<div class="col-auto" id="read-detail">
				</div>
				</div>

				<h2 id="scrollspyHeading3">상품 제조 연월</h2>
							<h4>2023-06-17</h4>
							<h2 id="scrollspyHeading4">세탁 시 주의 사항</h2>
							

							
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
										data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">천연가죽</button>
									</h2>
									<div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<p>1. 건조시킬 때에는 응달에서 말려주십시오.</p>
											<p>2. 젖었을 때에는 직사일광이나 불로 건조 시키지 마십시오.</p>
											<p>3. 오염시 부드러운 솔로 닦고, 슈크리너를 사용하십시오.</p>
											<p>4. 보존시에는 적정한 온도와 습도에서 보관하십이오.</p>
											<p>5. 본제품은 세탁이 불가합니다. </p>
											<p>6. 불꽃 접근시 불길이 옮겨 붙을 가능성이 있으니 주의해 주십시오.</p>
											<p>7. 신발 뒷꿈치를 꺾어 신지 마십시오.</p>
											<p>8. 제품의 수명 연장을 위해 사용 용도를 주의해 주십시오.</p>
										
										
											
											
											
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
										data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">섬유제품 또는 합성제품</button>
									</h2>
									<div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<p>1. 건조시킬 때에는 응달에서 말려주십시오.</p>
											<p>2. 기름기가 있는 장소에서의 사용은 피하십시오.</p>
											<p>3. 불옆에 놓으면 변화하거나 변형이 발생할 수 있으니 주의 하십시오.</p>
											<p>4. 표면의 오염 발생시 비눗물을 적신 천을 사용하고, 구두약등의 보혁유를 사용할 필요는 없습니다. </p>
											<p>5. 본제품은 세탁이 불가합니다. </p>
											<p>6. 불꽃 접근시 불길이 옮겨 붙을 가능성이 있으니 주의해 주십시오.</p>
											<p>7. 신발 뒷꿈치를 꺾어 신지 마십시오.</p>
											<p>8. 제품의 수명 연장을 위해 사용 용도를 주의해 주십시오.</p>

										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
										data-bs-target="#flush-collapseThree" aria-expanded="false"
										 aria-controls="flush-collapseThree">구매 후기</button>
									</h2>
									<div id="flush-collapseThree" class="accordion-collapse collapse"
									 data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
					
											
								<div class="container">
									<c:forEach var="review" items="${list}">
										<div class="card my-3">
											<div class="card-header">
												<strong>${review.memberId}</strong>
											</div>
								 				<div class="rating" data-jumsu="${review.jumsu}">
											</div>
											<div class="card-body">
												<p class="card-text">${review.contents}</p>
												<p class="card-text text-muted">
												<small>
													<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${review.regdate}" />
												</small>
											</div>
										</div>
									</c:forEach>
								</div>

							</div>
									</div>
								</div>
										
								
							</div>
							

							<h2 id="scrollspyHeading5">제품 구매 시 필독</h2>
							<h3>교환 불가 안내</h3>
							<p>제품 사이즈 교환은 불가하며, 반품 후 재구매만 가능합니다.</p>
						</div>
						
						
					</div>
		

<!-- 페이지 나누기 종료 -->

		

	</div>
</section>



<!-- Start Script -->
<script src="../assets/js/jquery-1.11.0.min.js"></script>
<script src="../assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/templatemo.js"></script>
<script src="../assets/js/custom.js"></script>

<script src="../css/stars.js"></script>

<link href="../powe/adidas1.img">
<link href="../powe/adidas2.img">
<link href="../powe/adidas3.img">
<link href="../powe/adidas4.img">


<form action="/shoes/detail" id="operForm">
	<%-- QnaPageDTO.cri.page 가능 --%>
	<input type="hidden" name="page" value="${cri.page}" />
	<input type="hidden" name="listAmount" value="${cri.listAmount}" />
<%-- 	<input type="hidden" name="keyword" value="${cri.keyword}" /> --%>
</form>
<!-- End Script -->
 <script>
	// 스크립트 실행순서: 첫번째 실행
	// js에서 가져다 쓰기 위한 작업
 
	const path= '${pageContext.request.requestURI}';
	
	const productId = ${product.productId};
	const result = '${result}';

	const csrfToken='${_csrf.token}';
	const pageIsRead=false;

	
</script>

<!-- <script src="/poweqnajs/qna.js"> </script> -->
<script src="/js/attachment.js"> </script>
<script src="/powedetailjs/shoesinfo.js"> </script>
<script src="/powedetailjs/detail.js"> </script>

  
<%@include file="../include/footer.jsp"%>





