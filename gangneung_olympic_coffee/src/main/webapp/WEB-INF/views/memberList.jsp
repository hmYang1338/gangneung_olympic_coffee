<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>
</head>
<body>
	<h1> 일반 유저 계정 보기(selectList)</h1>
	
	<form name="requestForm" id="requestForm" action="deleteMember.do" method="POST">
	<input type="hidden" id="password" name="password">
	<input type="hidden" id="email" name="email">
	<table>
		<tr>
			<th>이메일</th>
			<th>국가</th>
			<th>설정언어</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>성별</th>
			<th>생일</th>
			<th>가입일</th>
			<th>최근접속일</th>
			<th>삭제버튼</th>
		</tr>
		<c:forEach items="${requestScope.memberList}" var="member">
			<tr>
				<td>${member.email}</td>
				<td>${member.nationCode}</td>
				<td>${member.lanCode}</td>
				<td>${member.name}</td>
				<td>${member.tel}</td>
				<td>${member.gender}</td>
				<td>${member.birth}</td>
				<td>${member.joinDate}</td>
				<td>${member.lastDate}</td>
				<td><input type="button" name="deleteMember"  value="Delete" onclick="sendDelete('${member.email}')"></td>
			</tr>
		</c:forEach>
	</table>
	</form>
	<!-- 사용자 탈퇴가 맞게 email Session 처리 해줘야함 -->
 	<script>
		function sendDelete(email){
				var password = prompt("삭제할 아이디의 비밀번호를 입력하세요");	
				if(password != null){
					console.log(password);
					document.getElementById("password").value = password;
					document.getElementById("email").value = email;
					document.getElementById("requestForm").submit();
				}else{
					return false;
				}
		}	
	</script>
	
	
	
</body>
</html>