<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 로그인 구현 -->
		${errMsg}
		<form action="loginPage.do" method="POST">
			<input type="email" name="email" id="email" />
			<input type="password" name="password" id="password" /> 
			<input type="submit" value="로그인">
		</form>
	<br>

</body>
</html>