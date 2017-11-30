<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<hr>
<form>
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%">
	<tr>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">번호</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">신고자</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">카페평가</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">제품평가</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">회원</span></b></font>
			</p>
		</td>
		<td bgcolor="#f2e6d9">
			<p align="center">
				<font color="white"><b><span style="font-size: 9pt;">신고날짜</span></b></font>
			</p>
		</td>
		<c:choose>
			<c:when test="${not empty adminSession.email}">
				<td bgcolor="#f2e6d9">
					<p align="center">
						<font color="white"><b><span style="font-size: 9pt;">비고</span></b></font>
					</p>
				</td>
			</c:when>
		</c:choose>
	</tr>
	<c:forEach items="${reportList}" var="data">
		<tr>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.seq}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.email}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.sratNum}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.pratNum}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.memail}</span>
				</p>
			</td>
			<td bgcolor="">
				<p align="center">
					<span style="font-size: 9pt;">${data.repDate}</span>
				</p>
			</td>
			<c:choose>
				<c:when test="${not empty adminSession.email}">
					<td bgcolor="">
						<p align="center">
							<span><input type="button" value="x" onclick="deleteReport('${data.seq}')"></span>
						</p>
					</td>
				</c:when>
			</c:choose>
			
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

</script>