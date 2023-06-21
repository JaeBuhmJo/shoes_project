<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>index</h1>
<h1><a href="/shop/list" id="toList">list</a></h1>
<h1><a href="/admin/index" id="toAdmin">admin</a></h1>

<form action="" id="operForm">
	<input type="hidden" name="page" value="1"/>
	<input type="hidden" name="listAmount" value="15"/>
	<input type="hidden" name="searchType" value=""/>
	<input type="hidden" name="keyword" value=""/>
	<input type="hidden" name="order" value="registered-date-desc"/>
</form> 
<script src="/js/index.js"></script>
</body>  
</html>