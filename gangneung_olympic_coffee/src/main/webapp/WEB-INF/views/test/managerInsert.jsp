<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>��� ���� ����(insert)</h1>
	<form action='<c:url value="insertManager.do"/>' method="post">
		�̸��� : <input type="text" name="email" id="email" /><br>
		��й�ȣ : <input type="password" name="password" id="password" /><br>
		�̸� : <input type="text" name="name" id="name" /><br>
		��ȭ��ȣ : <input type="text" name="tel" id="tel" /><br>
		������� : <input type="text" name="birth" id="birth" /><br>
		����ڵ� : <input type="text" name="lanCode" id="lanCode" /><br>
		storeID : <input type="text" name="id" id="id" /><br>
		�̹��� : <input type="text" name="imgDir" id="imgDir" /><br>
		major : <input type="text" name="major" id="major" /><br>
		<input type="submit" value="��� ���">
	</form>
</body>
</html>