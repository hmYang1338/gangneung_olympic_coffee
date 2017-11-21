<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	<div class="container col-centered text-center">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 blue-background">
	<h1>운영자 계정 생성(insert)</h1>
	<form class="form-group brown" action='<c:url value="insertManager.do"/>' method="post" id="insertManager" name="insertManager">
		<p align="left" style="color: blue;">이 메 일 : </p>
		<input type="text" name="email" id="email" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">비밀번호 : </p>
		<input type="password" name="password" id="password" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">이    름 : </p>
		<input type="text" name="name" id="name" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">전화번호 : </p>
		<input type="text" name="tel" id="tel" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">생년월일 : </p>
		<input type="text" name="birth" id="birth" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">언어코드 : </p>
		<input type="text" name="lanCode" id="lanCode" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">카 페 ID : </p>
		<input type="text" name="id" id="id" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">이 미 지 : </p>
		<input type="text" name="imgDir" id="imgDir" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">Major : </p>
		<input type="text" name="major" id="major" class="form-control input-lg blue"/><br> 
		
		<input class="btn btn-default blue blue-background radius" type="submit" value="운영자 등록" onclick="shin()">
		<hr>
	</form>
	</div>
	</div>
	
	<script type="text/javascript">
		var emailCheck = false;
		var nameCheck = false;

		/* 이메일 패턴 설정 */
		function validateEmail(email) {
			var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			return re.test(email);
		}

		/* 이메일 패턴 확인 */
		function checkEmail() {
			var email = document.getElementById("email").value;
			if (validateEmail(email)) {
				emailCheck = true;
			} else {
				emailCheck = false;
				alert("올바른 이메일을 입력하여 주세요.");
			}
		}

		/* 이름 확인 - NULL 불가 */
		function checkName() {
			var name = document.getElementById("name").value;
			if (name.length > 0) {
				nameCheck = true;
			} else {
				nameCheck = false;
				alert("올바른 이름을 입력하여 주세요");
			}
		}

		function shin1() {
			checkEmail();
			checkName();
			console.log("managerInsert Test1");

			if (emailCheck && nameCheck) {
				console.log("managerInsert Test2");
				document.getElementById("insertManager").submit();
			} else {
				alert("회원가입에 실패하였습니다.");
			}
		}
	</script>
</body>
</html>