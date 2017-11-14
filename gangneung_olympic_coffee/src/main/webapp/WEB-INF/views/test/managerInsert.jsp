<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
var emailCheck = false;
var nameCheck = false;

/* 이메일 패턴 설정 */
function validateEmail(email) {
	  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	  return re.test(email);
	}

/* 이메일 패턴 확인 */
function checkEmail(){
	var email = document.getElementById("email").value;
	if(validateEmail(email)){
		emailCheck = true;
	}else{
		emailCheck = false;
		alert("올바른 이메일을 입력하여 주세요.");
	}
}

/* 이름 확인 - NULL 불가 */
function checkName(){
	var name = document.getElementById("name").value;
	if(name.length>0){
		nameCheck = true;
	}else{
		nameCheck = false;
		alert("올바른 이름을 입력하여 주세요");
	}
}

function shin1(){
	checkEmail();
	checkName();
	console.log("managerInsert Test1");
	
	if(emailCheck&&nameCheck){
		console.log("managerInsert Test2");
		document.getElementById("insertManager").submit();
	}else{
		alert("회원가입에 실패하였습니다.");
	}
}
</script>
</head>
<body>
<h1>운영자 계정 생성(insert)</h1>
	<form action='<c:url value="updatePassword.do"/>' method="post" id="insertManager" name="insertManager">
		이메일 : <input type="text" name="email" id="email" /><br>
		비밀번호 : <input type="password" name="password" id="password" /><br>
		이름 : <input type="text" name="name" id="name" /><br>
		전화번호 : <input type="text" name="tel" id="tel" /><br>
		생년월일 : <input type="text" name="birth" id="birth" /><br>
		언어코드 : <input type="text" name="lanCode" id="lanCode" /><br>
		storeID : <input type="text" name="id" id="id" /><br>
		이미지 : <input type="text" name="imgDir" id="imgDir" /><br>
		major : <input type="text" name="major" id="major" /><br>
		<input type="submit" value="운영자 등록" onclick="shin()">
	</form>
</body>
</html>