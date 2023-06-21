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
					<img class="powe-adidas1" src="/powe/adidas1.img" alt="Card image cap" id="product-detail">
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
			
			
			<!-- col end -->
			<div class="col-lg-7 mt-5" >
				<div class="card">
					<div class="card-body">
					<div id="productdetail">
					<form action="" method="post" id="detailForm">
					
						<h1 class="h2" id="brandcart">${product.brand}</h1>
						<p class="h3 py-2" id="pricecart">${product.price}</p>
						<p class="py-2">
							<i class="fa fa-star text-warning">1</i>
							<i class="fa fa-star text-warning">2</i>
							<i class="fa fa-star text-warning">3</i>
							<i class="fa fa-star text-warning">4</i>
							<i class="fa fa-star text-secondary">5</i>
							<span class="list-inline-item text-dark">별점 4.8 | 36 댓글 수</span>
						</p>
						<ul class="list-inline">
							<li class="list-inline-item">
								<h6 id="categorycart">${product.category}</h6>
								
							</li>
							
						</ul>
					</form>
					</div>
								<!-- 상품 간략 정보 -->
						${product.detail}
							<h4>변함없는 디자인으로 돌아온 1991 가젤 30년이 넘는 시간 동안 사랑받아 온 심플함의 아이콘.</h4>
							
							<p>
							 이번 버전의 가젤은 큰 인기를 얻었던 1991 가젤의 클래식한 소재, 칼라, 텍스쳐, 구조를 그대로 이어갑니다. 가죽 갑피에 대비색상 3-스트라이프와 힐 탭을 더해 90년대 초반의 오리지널 스타일을 선보입니다.</p>
						

						<form action="" method="post" id="radiodetail">
							<input type="hidden" name="product-title" value="Activewear" id="footSize">
							<div class="row">
								<div class="col-auto">
									<ul class="list-inline pb-3" id="detailsize">
										<li class="list-inline-item">Size : </li>
										<select class="form-select" aria-label="" name="size" id="size">
										  <option selected>사이즈 선택</option>
										  <option value="200">200</option>
										  <option value="210">210</option>
										  <option value="220">220</option>
										  <option value="230">230</option>
										  <option value="240">240</option>
										  <option value="250">250</option>
										  <option value="260">260</option>
										  <option value="270">270</option>
										  <option value="280">280</option>
										</select>										
							</ul>
													
																								
								</div>
								
							</div>
							<div class="row pb-3">
								<div class="col d-grid">
									<button type="submit" class="btn btn-success btn-lg" name="" value="buy">찜 목록 추가</button>
								</div>
								<div class="col d-grid">
									<button type="submit" class="btn btn-success btn-lg" id="goCart" name="submit" value="addtocard">Add To Cart</button>
								</div>
							</div>
						</form>

					
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
										data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">상품평</button>
									</h2>
									<div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											
											<p>상품평</p>
											<span class="list-inline-item text-dark">별점 4.8 | 36 ${qna.reviewCnt}</span>
											
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
										data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">상품문의</button>
									</h2>
									<div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											
											<p>상품문의</p>
											
											
										</div>
									</div>
								</div>
								
							</div>
							

							<h2 id="scrollspyHeading5">제품 구매 시 필독</h2>
							<h3></h3>
							<p>제품 구매 시 교환 및 확인 불가능하다는 점 미리 양해 안내 드립니다.</p>
						</div>
						
						
					</div>
		
		
	
		<div class="row text-left p-2 pb-3">
			<h4>이 달의 추천 상품</h4>
		</div>

<div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
						<!--Start Slides-->
						<div class="carousel-inner product-links-wap" role="listbox">

							<!--First slide-->
							<div class="carousel-item active">
								<div class="row">
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas3.img" alt="Product Image 1">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas4.img" alt="Product Image 2">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas4.img" alt="Product Image 3">
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
											<img class="card-img img-fluid" src="/powe/adidas4.img" alt="Product Image 4">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas2.img" alt="Product Image 5">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas2.img" alt="Product Image 6">
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
											<img class="card-img img-fluid" src="/powe/adidas3.img" alt="Product Image 7">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas2.img" alt="Product Image 8">
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

	
		<div class="row text-left p-2 pb-3">
			<h4>신상품</h4>
		</div>

<div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
						<!--Start Slides-->
						<div class="carousel-inner product-links-wap" role="listbox">

							<!--First slide-->
							<div class="carousel-item active">
								<div class="row">
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas3.img" alt="Product Image 1">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas4.img" alt="Product Image 2">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas4.img" alt="Product Image 3">
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
											<img class="card-img img-fluid" src="/powe/adidas4.img" alt="Product Image 4">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas2.img" alt="Product Image 5">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas2.img" alt="Product Image 6">
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
											<img class="card-img img-fluid" src="/powe/adidas3.img" alt="Product Image 7">
										</a>
									</div>
									<div class="col-4">
										<a href="#">
											<img class="card-img img-fluid" src="/powe/adidas2.img" alt="Product Image 8">
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


	</div>
</section>



<!-- Start Script -->
<script src="/assets/js/jquery-1.11.0.min.js"></script>
<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/templatemo.js"></script>
<script src="/assets/js/custom.js"></script>
<script src="/powedetailjs/detail.js"></script>
<link href="/powe/adidas1.img">
<link href="/powe/adidas2.img">
<link href="/powe/adidas3.img">
<link href="/powe/adidas4.img">

<!-- End Script -->
 <script>
	// 스크립트 실행순서: 첫번째 실행
	//게글 글번호 가져오기
	const product = ${product.productId};
</script>




<%@include file="../include/footer.jsp"%>










