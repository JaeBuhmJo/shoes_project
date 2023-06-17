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
											<img class="card-img img-fluid" src="/powe/adidas2.img" alt="Product Image 3">
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
											<img class="card-img img-fluid" src="/powe/adidas3.img" alt="Product Image 5">
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
					
				</div>
			</div>
			
			
			<!-- col end -->
			<div class="col-lg-7 mt-5">
				<div class="card">
					<div class="card-body">
						<h1 class="h2">ex)운동화${shoes.category}</h1>
						<p class="h3 py-2">$25.00</p>
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
								<h6>ex)${adidas.brand}?</h6>
							</li>
							<li class="list-inline-item">
								<p class="text-muted">
									<strong>ex)${sports.detail}</strong>
								</p>
							</li>
						</ul>

								<!-- 상품 간략 정보 -->
						
							<h4>변함없는 디자인으로 돌아온 1991 가젤 30년이 넘는 시간 동안 사랑받아 온 심플함의 아이콘.</h4>
							
							<p>
							 이번 버전의 가젤은 큰 인기를 얻었던 1991 가젤의 클래식한 소재, 칼라, 텍스쳐, 구조를 그대로 이어갑니다. 가죽 갑피에 대비색상 3-스트라이프와 힐 탭을 더해 90년대 초반의 오리지널 스타일을 선보입니다.</p>
						

						<form action="" method="">
							<input type="hidden" name="product-title" value="Activewear">
							<div class="row">
								<div class="col-auto">
									<ul class="list-inline pb-3">
										<li class="list-inline-item">Size : <input type="hidden" name="product-size" id="product-size" value="S">
										</li>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
											<label class="form-check-label" for="inlineRadio1">210</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<label class="form-check-label" for="inlineRadio2">220</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<label class="form-check-label" for="inlineRadio2">230</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<label class="form-check-label" for="inlineRadio2">240</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<label class="form-check-label" for="inlineRadio2">250</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<label class="form-check-label" for="inlineRadio2">260</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<label class="form-check-label" for="inlineRadio2">270</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<label class="form-check-label" for="inlineRadio2">280</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<label class="form-check-label" for="inlineRadio2">290</label>
										</div>
										
									</ul>
								</div>
								<div class="col-auto">
									<ul class="list-inline pb-3">
										<li class="list-inline-item text-right">Quantity <input type="hidden" name="product-quanity" id="product-quanity" value="1">
										</li>
										<li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
										<li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
										<li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
									</ul>
								</div>
							</div>
							<div class="row pb-3">
								<div class="col d-grid">
									<button type="submit" class="btn btn-success btn-lg" name="submit" value="buy">Buy</button>
								</div>
								<div class="col d-grid">
									<button type="submit" class="btn btn-success btn-lg" name="submit" value="addtocard">Add To Cart</button>
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
										data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">주의 사항</button>
									</h2>
									<div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											
											<p>·  건조시에는 강한햇볕을 피하고 통풍이 잘되는 그늘에서 건조하십시오.</p>
											<p>·  제품 혼용율에 따라 세탁 및 취급 유의 사항이 변경될 수 있으므로 반드시 부착되어 있는 케어라벨 내용을 확인하신 후 세탁하시기 바랍니다. </p>
											<p>* 주의! 작은 부품이 탈락되면 삼킬 수 있습니다.</p>
											<p>* 제품 혼용율에 따라 세탁 및 취급 유의 사항이 변경될 수 있으므로 반드시 부착되어 있는 케어라벨 내용을 확인하신 후 세탁하시기 바랍니다.  </p>
											
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
<link href="/powe/adidas1.img">
<link href="/powe/adidas2.img">
<link href="/powe/adidas3.img">
<link href="/powe/adidas4.img">


<!-- End Script -->


</body>

</html>


<%@include file="../include/footer.jsp"%>







