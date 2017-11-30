<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<h1> Member List</h1>
	<form action="deleteMemberByManager.do" id="requestForm" method="POST">
		<input type="hidden" name="email" id="email" value="${member.email}">
		<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%">
			<tr>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">이메일</span></b></font>
			</p></th>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">국가</span></b></font>
			</p></th>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">설정언어</span></b></font>
			</p></th>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">이름</span></b></font>
			</p></th>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">전화번호</span></b></font>
			</p></th>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">성별</span></b></font>
			</p></th>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">생일</span></b></font>
			</p></th>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">가입일</span></b></font>
			</p></th>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">최근접속일</span></b></font>
			</p></th>
				<th bgcolor="#f2e6d9"><p align="center">
				<font color="white"><b><span style="font-size: 11pt;">삭제</span></b></font>
			</p></th>
			</tr>
			<c:forEach items="${requestScope.memberList}" var="member">
				<tr>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">${member.email}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">${member.nationCode}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">${member.lanCode}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">${member.name}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">${member.tel}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">${member.gender}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">${member.birth}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">${member.joinDate}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">${member.lastDate}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;"><input type="button" name="deleteMember"  value="Delete" onclick="sendDelete('${member.email}')"></span>
						</p>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
 
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
