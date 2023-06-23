<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<security:authorize access="!isAuthenticated">
	<h1> 인덱스 페이지</h1>
	<a href="/member/register">회원가입</a>
	<br />
	<a href="/member/login">로그인</a>
	<br />
</security:authorize>
<security:authorize access="isAuthenticated"> 
	 <form action="/logout" method="post" >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<button class="btn btn-info" type="submit">로그아웃</button>
	 </form>	
	 <a href="/member/modify">회원수정</a>
	 <a href="/member/remove">회원삭제</a>
	 <a href="/member/memberPage">회원상세정보</a>
</security:authorize> 
	
