<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<!-- Start Content -->
<div class="container py-5">
	<div class="row">  

		<div class="col-lg-3">
			<h1 class="h2 pb-4">Categories</h1>
			<ul class="list-unstyled templatemo-accordion">
				<li class="pb-3 d-flex justify-content-between h3" id="gender">Gender <i class="fa fa-fw fa-chevron-circle-right mt-1"></i>
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check radio-gender" name="btnradio" value="" id="option1" autocomplete="off"> 
						<label class="btn btn-outline-dark" for="option1">전체</label>
						<input type="radio" class="btn-check radio-gender" name="btnradio" value="for-men" id="option2" autocomplete="off">
						<label class="btn btn-outline-dark" for="option2">남성</label>
						<input type="radio" class="btn-check radio-gender" name="btnradio" value="for-women" id="option4" autocomplete="off">
						<label class="btn btn-outline-dark" for="option4">여성</label>
					</div>
				</li>
				<li class="pb-3" id="category"><a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#"> Category <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
				</a>
					<ul id="collapseThree" class="collapse list-unstyled pl-3">
						<li><a class="text-decoration-none" href="">전체</a></li>
						<li><a class="text-decoration-none" href="running">운동화</a></li>
						<li><a class="text-decoration-none" href="shoes">구두</a></li>
						<li><a class="text-decoration-none" href="slipper">슬리퍼</a></li>  
					</ul></li>
			</ul>
		</div>  

		<div class="col-lg-9">
			<div class="d-flex mb-0">
				<div class="mx-2">
					<select class="form-control border border-secondary" id="order" name="order">
						<option value="registered-date-desc" >최근 등록 순</option>
						<option value="sold-count-desc" >많이 팔린 순</option>
						<option value="price-desc" >높은 가격 순</option>
						<option value="price-asc" >낮은 가격 순</option>
					</select>
				</div>
				<div class="me-auto">
					<select class="form-control text-center border border-secondary" id="listAmount" name="listAmount">
						<option value="15" >15개씩 보기</option>
						<option value="30" >30개씩 보기</option>
						<option value="3" >3개씩 보기</option> 
					</select>  
				</div>
				<form class="d-inline-flex justify-content-end mb-3" id="innerSearchForm">      
					<input class="form-control me-2 border border-success" type="search" placeholder="결과 내 재검색" aria-label="Search" id="innerSearchKeyword">
					<button class="btn btn-outline-success" type="submit" id="shoesInnerSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
				</form>
			</div>
				<hr class="mt-0"/>
			<div class="row productList">
			  
			</div>
  
			<!-- pagination -->
			<div div="row">
				<ul class="pagination pagination-lg justify-content-end" id="shopPagination">
				</ul>             
			</div>
		</div>
    
	</div>    
</div>
<!-- End Content -->

<script>
	const csrfToken = '${_csrf.token}';
</script>
	<!-- Bootstrap core JS-->
    <script src="/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/js/templatemo.js"></script>
    <script src="/assets/js/custom.js"></script>
	<script src="/js/list.js"></script>

	
<%@ include file="../include/footer.jsp"%>
