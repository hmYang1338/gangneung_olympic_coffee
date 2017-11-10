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
<script type="text/javascript">
function loadDoc() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var resData = this.responseText; 
			document.getElementById("list").innerHTML = resData;
		}
	};
	xhttp.open("GET", "listAjax.do", true);
	xhttp.send();
}
</script>


	${errMsg}
	<form action='<c:url value="loginPage.do"/>' method="post">
		<input type="text" name="email" id="email" />
		<input type="password" name="password" id="password" /> 
		<input type="submit" value="로그인">
	</form>
	<br>

	<form action='<c:url value="insertMember.do"/>' method="post">
		<input type="text" name="email" id="email" /> 
		<input type="password" name="password" id="password" /> 
		<select name="authority">
			<option value="ROLE_USER">사용자</option>
			<option value="ROLE_ADMIN">관리자</option>
		</select> 
		<input type="submit" value="회원가입">
	</form>
	
	<br><br><hr><br><br>
	
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
	
	<br><br><hr><br><br>
	
	<h1>운영자 계정 보기(select)</h1>
	<form action='<c:url value="selectAllManager.do"/>' method="post">
		<input type="submit" value="운영자 보기">
	</form>
	
	<br><hr><br>
	<div align=right><span style="font-size:9pt;">&lt;<a onclick="loadDoc()">리스트로 보기</a>&gt;</span></div>
	<div id="list"></div>
	
</body>
</html>