<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <security:authentication property="principal.memberDTO" var="userDetails" />
	 <form class="col-md-9 m-auto" method="post" role="form">
	 <div class="form-group mb-3">
        <label for="memberId">아이디</label>
        <input type="text" class="form-control mt-1" id="memberId" name="memberId" placeholder="아이디" value="${userDetails.memberId}" readonly>
      </div>
	 <div class="form-group mb-3">
        <label for="password">기존 비밀번호</label>
        <input type="password" class="form-control mt-1" id="password" name="password" placeholder="비밀번호" value="">
      </div>
      <div class="col text-end mt-2">
          <button type="submit" class="btn btn-success btn-lg px-3">회원삭제</button>
      </div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>
</body>
</html>