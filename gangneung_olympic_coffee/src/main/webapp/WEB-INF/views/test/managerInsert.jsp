<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>운영자 계정 생성(insert)</h1>
	<form action='<c:url value="insertManager.do"/>' method="post">
		이메일 : <input type="text" name="email" id="email" /><br>
		비밀번호 : <input type="password" name="password" id="password" /><br>
		이름 : <input type="text" name="name" id="name" /><br>
		전화번호 : <input type="text" name="tel" id="tel" /><br>
		생년월일 : <input type="text" name="birth" id="birth" /><br>
		언어코드 : <input type="text" name="lanCode" id="lanCode" /><br>
		storeID : <input type="text" name="id" id="id" /><br>
		이미지 : <input type="text" name="imgDir" id="imgDir" /><br>
		major : <input type="text" name="major" id="major" /><br>
		<input type="submit" value="운영자 등록">
	</form>
</body>
</html>