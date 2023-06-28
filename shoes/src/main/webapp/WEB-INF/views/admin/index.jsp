<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/adminheader.jsp"%>
<div id="layoutSidenav_content">

	<!-- dashboard start -->
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Dashboard</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Dashboard</li>
			</ol>

			<!-- cards start -->
			<div class="row">
				<div class="col-xl-3 col-md-6">
					<div class="card border-primary mb-4" style="max-width: 20rem;">
						<div class="card-header text-bg-primary">상품 관리</div>
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<span>판매중 : </span> <span>${dashboardData.onSaleProductsCount} 건</span>
							</div>
							<div class="d-flex justify-content-between">
								<span>판매중지 : </span> <span>${dashboardData.offSaleProductsCount} 건</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card border-warning mb-4" style="max-width: 20rem;">
						<div class="card-header text-bg-warning">전일 판매 통계</div>
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<span>주문건수 : </span> <span>${dashboardData.dayPurchaseCount} 개</span>
							</div>
							<div class="d-flex justify-content-between">
								<span>주문액 : </span> <span>${dashboardData.daySalesAmount} 원</span>
							</div>
							<div class="d-flex justify-content-between">
								<span>주문 고객 수 : </span> <span>${dashboardData.dayCustomerCount} 명</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card border-success mb-4" style="max-width: 20rem;">
						<div class="card-header text-bg-success">고객 센터</div>
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<span>답변 미등록 문의 : </span> <span>${dashboardData.notAnsweredCount} 건</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card border-info mb-4" style="max-width: 20rem;">
						<div class="card-header  text-bg-info">회원 통계</div>
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<span>총 회원 수 : </span> <span>${dashboardData.totalMemberCount} 명</span>
							</div>
							<div class="d-flex justify-content-between">
								<span>일일 방문자 수 : </span> <span>${dashboardData.todayVisitCount} 명</span>
							</div>
							<div class="d-flex justify-content-between">
								<span>전일 방문자 수 : </span> <span>${dashboardData.dailyVisitCount} 명</span>
							</div>
							<div class="d-flex justify-content-between">
								<span>총 방문자 수 : </span> <span>${dashboardData.totalVisitCount} 명</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- cards end -->
<hr class="mt-4 mb-5"/>
			<!-- chart start -->
			<div class="row">
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> 판매 추이
						</div>
						<div class="card-body">
							<canvas id="myAreaChart" width="100%" height="40"></canvas>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card mb-4"> 
						<div class="card-header">
							<i class="fas fa-chart-pie me-1"></i> Pie Chart Example
						</div>
						<div class="card-body">
							<canvas id="myPieChart" width="100%" height="40"></canvas>
						</div> 
					</div>
				</div>  
			</div>
			<!-- chart end -->

		</div>
	</main>
	<!-- dashboard end -->
	<script> 
		const areaChartData = ${dashboardAreaChart}
	</script>

	<script src="/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="/js/dashboard-chart.js"></script>

	<%@ include file="../include/adminfooter.jsp"%>