<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%">
	<tr>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">ID</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">�̸�</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">�ּ�</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">��ȭ��ȣ</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">��ð�</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">����ڵ�</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">�浵</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">����</span></b></font>
			</p>
		</td>

	</tr>
	<c:forEach items="${list}" var="data">
		<tr>
			<td bgcolor="">
				<form action="post">
					<p>
						<span style="font-size: 9pt;"> <a
							href="detailStore.do/${data.id}.do">${data.id}</a>
						</span>
					</p>
				</form>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.name}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.addr}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.tel}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.storeHours}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.lanCode}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.lat}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.longi}</span>
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
