<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style type="text/css">
.brown-background{
		background: #f2e6d9;
	}
.brown{
	color: #996633;
}
.blue-background{
	background: #f0f0f5;
}
.blue{
	color: #666699;
}
.radius{
	border-width: 3px;
	border-color: white;
}
.radius:hover{
	background-color:white;
	color:black;
}

.raio-group{
	margin-left: 10%;
	margin-bottom: 1px;
}
	
.hr-white{
	border-top: 3px solid #f8f9fa;
}

/* 아래부터는 재정의 */
.control-label{
    cursor: default;
    font-size: large;
}
.pull-right {
    float: right!important;
    margin-right: 20px;
}
.btn-bottom-margin{
	margin-bottom: 20px;
}
</style>

	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
	<form action='<c:url value="updatePassword.do"/>' method="post" id="updatePassword" name="updatePassword" role="form">
	<hr class="hr-white">
	<h3 class="blue text-center">비밀번호 변경</h3><hr class="hr-white">
		<!-- Store ID -->
		<label for="now_password" class="control-label blue">현재비밀번호&nbsp;:&nbsp;</label>
		<input type="password" id="now_password" name="now_password" maxlength="16" class="form-control input-lg blue" placeholder="Now Password" required="required"><br>  
		
		<!-- 이름 -->
		<label for="ch_password" class="control-label blue">변경비밀번호&nbsp;:&nbsp;</label>
		<input type="password" id="ch_password" name="ch_password" maxlength="16" class="form-control input-lg blue" placeholder="Change Password" required="required" onchange="compare()"><br> 
		
		<!-- 주소 -->
		<label for="ch_password_ck" class="control-label blue">비밀번호확인&nbsp;:&nbsp;</label>
		<input type="password" id="ch_password_ck" name="ch_password_ck" maxlength="16" class="form-control input-lg blue" placeholder="Check password" required="required" onchange="compare()"><br> 
		
		<input type="button" class="btn btn-default pull-right btn-bottom-margin" id="button" value="비밀번호 변경" onclick="checking();">
		<hr>
	</form>
	
	<script type="text/javascript">
		/* 이름 확인 - NULL 불가 */
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
		
		function checking() {
	
			if (passwordCheck && passwordLengthCheck) {
				alert("비밀번호");
				document.getElementById("updatePassword").submit();
			} else {
				alert("비밀번호 수정에 실패");
			}
		}
	</script>



