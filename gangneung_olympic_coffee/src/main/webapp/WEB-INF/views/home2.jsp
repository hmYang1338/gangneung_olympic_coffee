<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${errMsg}
	<form action='<c:url value="loginPage"/>' method="post">
		<input type="text" name="email" id="email" /> <input type="password"
			name="password" id="password" /> <input type="submit" value="로그인">
	</form>
	<br>

	<form action='<c:url value="insertMember"/>' method="post">
		<input type="text" name="email" id="email" /> <input type="password"
			name="password" id="password" /> <select name="authority">
			<option value="ROLE_USER">사용자</option>
			<option value="ROLE_ADMIN">관리자</option>
		</select> <input type="submit" value="회원가입">
	</form>
</body>
</html>