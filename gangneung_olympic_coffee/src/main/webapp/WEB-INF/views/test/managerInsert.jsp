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

/* �̸��� ���� ���� */
function validateEmail(email) {
	  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	  return re.test(email);
	}

/* �̸��� ���� Ȯ�� */
function checkEmail(){
	var email = document.getElementById("email").value;
	if(validateEmail(email)){
		emailCheck = true;
	}else{
		emailCheck = false;
		alert("�ùٸ� �̸����� �Է��Ͽ� �ּ���.");
	}
}

/* �̸� Ȯ�� - NULL �Ұ� */
function checkName(){
	var name = document.getElementById("name").value;
	if(name.length>0){
		nameCheck = true;
	}else{
		nameCheck = false;
		alert("�ùٸ� �̸��� �Է��Ͽ� �ּ���");
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
		alert("ȸ�����Կ� �����Ͽ����ϴ�.");
	}
}
</script>
</head>
<body>
<h1>��� ���� ����(insert)</h1>
	<form action='<c:url value="updatePassword.do"/>' method="post" id="insertManager" name="insertManager">
		�̸��� : <input type="text" name="email" id="email" /><br>
		��й�ȣ : <input type="password" name="password" id="password" /><br>
		�̸� : <input type="text" name="name" id="name" /><br>
		��ȭ��ȣ : <input type="text" name="tel" id="tel" /><br>
		������� : <input type="text" name="birth" id="birth" /><br>
		����ڵ� : <input type="text" name="lanCode" id="lanCode" /><br>
		storeID : <input type="text" name="id" id="id" /><br>
		�̹��� : <input type="text" name="imgDir" id="imgDir" /><br>
		major : <input type="text" name="major" id="major" /><br>
		<input type="submit" value="��� ���" onclick="shin()">
	</form>
</body>
</html>