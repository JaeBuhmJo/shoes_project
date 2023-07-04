<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<style>
	#cartstyle{
		margin: 0 1em;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<head>

    <title>Welcome!!! ship BLACKPEARL</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.ico">

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/assets/css/fontawesome.min.css">
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="/assets/css/slick.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/slick-theme.css">
    <!-- 방문자 집계 -->
	<script src="/js/visit-counter.js"></script>
	
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
    <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="/admin/page">🚢blackpearl.project</a>

                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">⚓010-020-0340</a>
                </div>
                <div>
                    <a class="text-light" href="/member/info" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="/member/info" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->


    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-dark logo h1 align-self-center blackpearl" style="black" href="/">
                BLACKPEARL
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> 
 
            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/">home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/member/qna">문의사항</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/shop/list" id="recentProductList">신상품</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/member/qna">qna</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
 
					<form class="d-flex" role="search" id="searchForm">      
						<input class="form-control me-2 border border-dark" type="search" placeholder="Search" aria-label="Search" id="searchKeyword">
						<button class="btn btn-outline-success" type="submit" id="shoesSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
					</form>

					<button type="button" id="cartstyle" class="btn btn-danger btn-lg"
									  onclick="location.href='/cart/'">cart</button>


					<div class="dropdown">
								<security:authorize access="isAnonymous()">
									<a class="dropdown-item" href="/member/login"> <i
										class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Login
									</a>
								</security:authorize>
								<security:authorize access="isAuthenticated()">
						<a class="btn btn-info dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> <span class="mr-2 d-none d-lg-inline text-gray-600 small">
									<security:authorize access="isAuthenticated()">
										<security:authentication property="principal.memberDTO.name" />
									</security:authorize>
									<span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
							</span>
							</a>
						<ul class="dropdown-menu">
							<li>
								<a class="dropdown-item" href="/member/memberPage"> <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="/chat/list"> <i class="fas fa-solid fa-comments fa-fw mr-2 text-gray-400"></i> 실시간 문의
								</a> 
								
								<hr />
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal" id="logout"> <i
										class="fas fa-sign-in-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout
									</a>
									 <form action="/logout" method="post" id="logoutForm">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									 </form>
							</li>
						</ul>
								</security:authorize>
					</div>
                
            </div>

        </div>
    </nav>
    <!-- Close Header -->