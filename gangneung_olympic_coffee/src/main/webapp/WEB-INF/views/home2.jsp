<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.brown-background {
	background: #f2e6d9;
}

.brown {
	color: #996633;
}

.blue-background {
	background: #f0f0f5;
}

.blue {
	color: #666699;
}
/*  	.green-background{ 
 		background: #daffda; 
	} 
	.green{ 
		color: #009933; 
	} */
.radius {
	border-width: 3px;
	border-color: white;
}

.radius:hover {
	background-color: white;
	color: black;
}
</style>
</head>
<body>

	<h1>관리자 페이지</h1>
	<hr>
	<br>
	<h3>운영자 통합관리</h3>
	<hr>
	<br>
	<button id="select" name="select" onclick="managerList()">운영자
		조회</button>
	<br>
	<button id="insert" name="insert" onclick="managerInsert()">운영자
		등록</button>
	<br>


	<br>
	<hr>
	<div id="selectform" align="center"></div>
	<div id="insertform" align="center"></div>
<!-- 
  <div class="container col-centered text-center">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 brown-background">
			<form class="form-group brown">
			<h1>관리자 페이지</h1>
			<hr>
			<h3>운영자 통합관리</h3>
			<hr>
			<input type="button" class="btn btn-default brown brown-background radius" id="select" name="select" onclick="managerList()" value="운영자 조회">
			<br>
			<input type="button" class="btn btn-default brown brown-background radius" id="insert" name="insert" onclick="managerInsert()" value="운영자 등록">
			<br>
			<hr>
			</form>
			<div id="selectform" align="center"></div>
			<div id="insertform" align="center"></div>
		</div>
	</div>  -->
	<!--  -->
	<br>
	<hr>
	<h1>운영자 페이지</h1>
	<hr>
	<h3>운영자 본인의 비밀번호 수정</h3>
	<hr>
	<button id="updatePassword" name="updatePassword" onclick="updatePassword()">패스워드 수정</button>
	<br>
	<div id="updatePasswordform" align="center"></div>
	
	
	
<script type="text/javascript">
/*
var managerListRequest;

function managerListBtn(){
	managerListRequest = sendRequest("listAjax.do", null, managerList, "GET")
}
function managerList(){
	if (productRatingByIdRequest.readyState == 4 && productRatingByIdRequest.status == 200) {
		var json = managerListRequest.responseText;
		json = JSON.parse(json);
		console.log(json);
	}
}
 */
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


function updatePassword(){
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
			var resData = this.responseText;
			document.getElementById("updatePasswordform").innerHTML = resData;
		}
	};
	xhttp.open("GET", "updatePasswordform.do", true);
	xhttp.send();
}
</script>
</body>
</html>
