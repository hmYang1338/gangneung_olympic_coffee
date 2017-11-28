<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><br>
<hr class="hr-white">
<h3 class="blue text-center">내 정보 관리</h3>
<hr class="hr-white">
<input type="hidden" name="email" value="${managerSession.email}">
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

	</tr>
		<tr>
			<td bgcolor="">
				<form action="post">
					<p align="center">
						<span style="font-size: 9pt;"> ${managerSession.email}</span>
					</p>
				</form>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${managerSession.id}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${managerSession.name}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${managerSession.tel}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${managerSession.birth}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${managerSession.major}</span>
				</p>
			</td>
		</tr>

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

<input type="button"
			class="btn btn-default" style="width: 350px" id=""
			name="" onclick="();" value="비밀번호 수정"> 
<hr>