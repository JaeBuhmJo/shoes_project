<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BLACKPEARL - 관리자 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <link href="/assets/css/custom.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
		
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand text-center" href="/admin/index">BLACKPEARL Admin</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
           
           <!-- 
            Navbar Search
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
             -->
            
            <!-- Navbar start -->
            <ul class="navbar-nav ms-0 ms-lg-auto">
                <li class="nav-item dropdown">
                    <a class="ms-auto nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/member/modify">비밀번호 변경</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!" id="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
           	 <form action="/logout" method="post" id="logoutForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			 </form>
            <!-- Navbar end -->
        </nav>
        
<div id="layoutSidenav">
<!-- sidenav start -->                
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <!-- interface start -->
                    <div class="sb-sidenav-menu-heading">Interface</div>
                    <a class="nav-link" href="/admin/product/list?searchType=&keyword=">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        상품 관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                    </a>
                    <a class="nav-link" href="/admin/inventory/list?searchType=&keyword=">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        재고 관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                    </a>
                    </div>
              </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                Start Bootstrap
            </div>
        </nav>
    </div>
        	
<!-- sidenav end -->
             
        