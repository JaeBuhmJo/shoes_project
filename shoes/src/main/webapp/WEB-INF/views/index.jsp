<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<security:authorize access="!isAuthenticated">
	<h1> 인덱스 페이지</h1>
	<h1><a href="/shop/list" id="toList">list</a></h1>
<h1><a href="/admin/index" id="toAdmin">admin</a></h1>

<form action="" id="operForm">
	<input type="hidden" name="page" value="1"/>
	<input type="hidden" name="listAmount" value="15"/>
	<input type="hidden" name="searchType" value=""/>
	<input type="hidden" name="keyword" value=""/>
	<input type="hidden" name="order" value="registered-date-desc"/>
</form>
	<a href="/member/register">회원가입</a>
	<br />
	<a href="/member/login">로그인</a>
	<br />
</security:authorize>
<security:authorize access="isAuthenticated"> 
	<h1><a href="/shop/list" id="toList">list</a></h1>
<h1><a href="/admin/index" id="toAdmin">admin</a></h1>

<form action="" id="operForm">
	<input type="hidden" name="page" value="1"/>
	<input type="hidden" name="listAmount" value="15"/>
	<input type="hidden" name="searchType" value=""/>
	<input type="hidden" name="keyword" value=""/>
	<input type="hidden" name="order" value="registered-date-desc"/>
</form> 
	 <form action="/logout" method="post" >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<button class="btn btn-info" type="submit">로그아웃</button>
	 </form>
	 <a href="/member/modify">회원수정</a>
	 <a href="/member/remove">회원삭제</a>
	 <a href="/member/memberDetail">회원상세정보</a>
	 <a href="/member/memberPage">회원페이지</a>
</security:authorize> 
<script src="/js/index.js"></script>
