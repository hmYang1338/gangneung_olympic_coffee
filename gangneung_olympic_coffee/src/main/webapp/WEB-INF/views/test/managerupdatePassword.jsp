<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container col-centered text-center">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 brown-background">
			<h4>비밀번호 수정</h4>
			<form class="form-group brown" action='<c:url value="updatePassword.do"/>' method="post" id="updatePassword" name="updatePassword" >
				<!-- <input type="hidden" id="email" name="email" value=" "><br>	 -->
				<!-- 운영자가 로그인 했을 경우 세션을 가져옴 -->
				<input class="form-control input-lg brown" type="password" name="now_password" id="now_password" maxlength="16" placeholder="현재 비밀번호"/><br> 
				<input class="form-control input-lg brown" type="password" name="ch_password" id="ch_password" maxlength="16" placeholder="변경 비밀번호" onchange="compare()" /><br> 
				<input class="form-control input-lg brown" type="password" name="ch_password_ck" id="ch_password_ck" maxlength="16" placeholder="변경 비밀번호 확인" onchange="compare()" /><br>
				<div id="alert"></div>
				<input class="btn btn-default brown" type="submit" value="비밀번호 변경" onclick="shin1()"><br>
			</form>
		</div>
	</div>
	
	<script src="js/ajax/httpRequest.js"></script>
	<script type="text/javascript">
		var passwordCheck = false;
		var passwordLengthCheck = false;

		function compare() {
			var alert = document.getElementById("alert");
			var pw1 = document.getElementById("ch_password").value;
			var pw2 = document.getElementById("ch_password_ck").value;
			if (pw1.length >= 8 && pw2.length >= 8) {
				passwordLengthCheck = true;
				if (pw1 != pw2) {
					passwordCheck = false;
					alert.innerHTML = "<font color='red'>일치하지 않습니다</font>";
				} else {
					passwordCheck = true;
					alert.innerHTML = "<font color='green'>일치합니다</font>";
				}
			} else {
				passwordLengthCheck = false;
				alert.innerHTML = "<font color='red'>비밀번호는 8자 이상입니다.</font>";
			}
		}

		function shin1() {
			console.log("test1");

			if (passwordCheck && passwordLengthCheck) {
				console.log("test2");
				document.getElementById("updatePassword").submit();
			} else {
				alert("비밀번호 수정에 실패");
			}
		}
	</script>
</body>
</html>