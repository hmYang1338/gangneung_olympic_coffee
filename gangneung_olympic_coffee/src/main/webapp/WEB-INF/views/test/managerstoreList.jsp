<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>카페 정보 보기(select)</h1>
	<table align="center" border="0" cellpadding="5" cellspacing="2"
		width="100%">
		<tr>
			<td bgcolor="#336699">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">ID</span></b></font>
				</p>
			</td>
			<td bgcolor="#336699">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">이름</span></b></font>
				</p>
			</td>
			<td bgcolor="#336699">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">주소</span></b></font>
				</p>
			</td>
			<td bgcolor="#336699">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">전화번호</span></b></font>
				</p>
			</td>
			<td bgcolor="#336699">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">운영시간</span></b></font>
				</p>
			</td>
			<td bgcolor="#336699">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">언어코드</span></b></font>
				</p>
			</td>
			<td bgcolor="#336699">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">경도</span></b></font>
				</p>
			</td>
			<td bgcolor="#336699">
				<p align="center">
					<font color="white"><b><span style="font-size: 9pt;">위도</span></b></font>
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
</body>
</html>