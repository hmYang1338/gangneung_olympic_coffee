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
function managerList() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var resData = this.responseText; 
			document.getElementById("selectform").innerHTML = resData;
		}
	};
	xhttp.open("GET", "listAjax.do", true);
	xhttp.send();
}
function managerInsert() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var resData = this.responseText; 
			document.getElementById("insertform").innerHTML = resData;
		}
	};
	xhttp.open("GET", "insertForm.do", true);
	xhttp.send();
}

/* 
function managerUpdate() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var resData = this.responseText; 
			document.getElementById("updateform").innerHTML = resData;
		}
	};
	xhttp.open("GET", "updateForm.do", true);
	xhttp.send();
}

 * 추후 입력예정 
 *
function managerDelete() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var resData = this.responseText; 
			document.getElementById("list").innerHTML = resData;
		}
	};
	xhttp.open("GET", "listAjax.do", true);
	xhttp.send();
} */
</script>
<!-- <div align=right><span style="font-size:9pt;">&lt;<a onclick="loadDoc()">리스트로 돌아가기</a>&gt;</span></div>
	<div id="list"></div> -->


	<h1>관리자 페이지</h1>
	<hr><br>
	<h3>운영자 통합관리</h3>
	<hr><br>
	<button id="select" name="select" onclick="managerList()">운영자 조회</button><br>
	<button id="insert" name="insert" onclick="managerInsert()">운영자 등록</button><br>
	
	
	<br><hr>
	<div id="selectform" align="center"></div>
	<div id="insertform" align="center"></div>
	
	<!-- 다른 곳으로 이동할 예정
	<button id="update" name="update" onclick="managerUpdate()">운영자 수정</button><br>
	<button id="delete" name="update">운영자 삭제</button><br>
	<div id="updateform" align="center"></div>
	<div id="deleteform" align="center"></div>
	 -->

</body>
</html>


<%-- 	member 회원가입 및 로그인 부분
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
 --%>	