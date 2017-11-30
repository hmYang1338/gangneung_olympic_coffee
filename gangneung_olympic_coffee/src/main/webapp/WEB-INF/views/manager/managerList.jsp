<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form action="deleteManager.do" id="requestForm" method="POST">
	<input type="hidden" name="email" id="email" value="${data.email}">
	<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%">
		<tr>
			<td bgcolor="#f2e6d9">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">이메일</span></b></font>
				</p>
			</td>
			<td bgcolor="#f2e6d9">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">카페
								id</span></b></font>
				</p>
			</td>
			<td bgcolor="#f2e6d9">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">이름</span></b></font>
				</p>
			</td>
			<td bgcolor="#f2e6d9">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">전화번호</span></b></font>
				</p>
			</td>
			<td bgcolor="#f2e6d9">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">생년월일</span></b></font>
				</p>
			</td>
			<td bgcolor="#f2e6d9">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">major</span></b></font>
				</p>
			</td>
			<th bgcolor="#f2e6d9">
				<p align="center">
					<font color="white"><b><span style="font-size: 11pt;">삭제</span></b></font>
				</p>
			</th>
		</tr>
		<c:forEach items="${list}" var="data">
			<tr>
				<td bgcolor="">
					<form action="post">
						<p align="center">
							<span style="font-size: 9pt;"> <a
								<%-- href="detail.do/${data.email}.do" --%> onclick="managerDetailA();">${data.email}</a>
							</span>
						</p>
					</form>
				</td>
				<td bgcolor="">
					<p align="center">
						<span style="font-size: 9pt;">${data.id}</span>
					</p>
				</td>
				<td bgcolor="">
					<p align="center">
						<span style="font-size: 9pt;">${data.name}</span>
					</p>
				</td>
				<td bgcolor="">
					<p align="center">
						<span style="font-size: 9pt;">${data.tel}</span>
					</p>
				</td>
				<td bgcolor="">
					<p align="center">
						<span style="font-size: 9pt;">${data.birth}</span>
					</p>
				</td>
				<td bgcolor="">
					<p align="center">
						<span style="font-size: 9pt;">${data.major}</span>
					</p>
				</td>
				<td bgcolor="">
					<p align="center">
						<span style="font-size: 9pt;"><input type="button" name="deleteManager"  value="Delete" onclick="sendDeleteBtn('${data.email}')"></span>
					</p>
				</td>
			</tr>
		</c:forEach>
	
		<tr>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;"></span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;"></span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;"></span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;"></span>
				</p>
			</td>
		</tr>
	</table>
</form>
<script>
function sendDeleteBtn(email){
	var check = prompt("삭제하고 싶으시다면 y를 ");	
	if(check.toLowerCase() == 'y' || check.toLowerCase() == 'yes'){
		document.getElementById("email").value = email;
		document.getElementById("requestForm").submit();
	}else{
		return false;
	}
}	
</script>