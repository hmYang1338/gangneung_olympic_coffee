<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
	font-weight: bold;
}
</style>

</head>
<body>
	<h1> Member List</h1>
<%-- 		<form action="deleteMemberByManager.do" id="requestForm" method="POST">
			<div class="row">
				<input type="hidden" name="email" id="email" value="${member.email}">
				<div class="divTableHeading">Email</div>
				<div class="divTableHeading">Nation</div>
				<div class="divTableHeading">Language</div>
				<div class="divTableHeading">Name</div>
				<div class="divTableHeading">CellPhone</div>
				<div class="divTableHeading">Gender</div>
				<div class="divTableHeading">BirthDay</div>
				<div class="divTableHeading">JoinDate</div>
				<div class="divTableHeading">LastDate</div>
				<div class="divTableHeading">Delete</div>
			</div>
				<c:forEach items="${requestScope.memberList}" var="member">
				<br>
			<div class="row">
					<div class="col">${member.email}</div>
					<div class="col">${member.nationCode}</div>
					<div class="col">${member.lanCode}</div>
					<div class="col">${member.name}</div>
					<div class="col">${member.tel}</div>
					<div class="col">${member.gender}</div>
					<div class="col">${member.birth}</div>
					<div class="col">${member.joinDate}</div>
					<div class="col">${member.lastDate}</div>
					<div class="col"><input type="button" name="deleteMember"  value="x" onclick="sendDelete('${member.email}')"></div>
			</div>
				</c:forEach>
			</form> --%>
	<form action="deleteMemberByManager.do" id="requestForm" method="POST">
		<input type="hidden" name="email" id="email" value="${member.email}">
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
				var check = prompt("삭제하고 싶으시다면 y를 ");	
				if(check.toLowerCase() == 'y' || check.toLowerCase() == 'yes'){
					document.getElementById("email").value = email;
					document.getElementById("requestForm").submit();
				}else{
					return false;
				}
		}	
	</script>
	
	
	
</body>
</html>