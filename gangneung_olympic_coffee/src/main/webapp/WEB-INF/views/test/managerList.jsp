<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>운영자 계정 보기(select)</h1>
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%">
		<tr>
	        <td bgcolor="#336699">
	            <p align="center"><font color="white"><b><span style="font-size:9pt;">이메일</span></b></font></p>
	        </td>
	        <td bgcolor="#336699">
	            <p align="center"><font color="white"><b><span style="font-size:9pt;">카페 id</span></b></font></p>
	        </td>
	        <td bgcolor="#336699">
	            <p align="center"><font color="white"><b><span style="font-size:9pt;">이름</span></b></font></p>
	        </td>
	        <td bgcolor="#336699">
	            <p align="center"><font color="white"><b><span style="font-size:9pt;">전화번호</span></b></font></p>
	        </td>
	        <td bgcolor="#336699">
	            <p align="center"><font color="white"><b><span style="font-size:9pt;">생년월일</span></b></font></p>
	        </td>
	        <td bgcolor="#336699">
	            <p align="center"><font color="white"><b><span style="font-size:9pt;">major</span></b></font></p>
	        </td>
	        
	    </tr>
<%-- 
	<c:if test="${empty list || fn:length(list) == 0}">
		<tr>
	        <td colspan="5">
	            <p align="center"><b><span style="font-size:9pt;">등록된 모델 정보가 없습니다.</span></b></p>
	        </td> 
	    </tr>
	</c:if>
 --%>
		<c:forEach items="${list}" var="data">
		    <tr>
		    	<td bgcolor="">
					<p><span style="font-size:9pt;">
					<a href="www/test2.do/read.do/${data.email}">${data.email}</a>
					</span></p>
	        	</td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">${data.email}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">${data.id}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">${data.name}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">${data.tel}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">${data.birth}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">${data.major}</span></p>
		        </td>
		    </tr>
		</c:forEach>
 	
	    <tr>
	        <td bgcolor="">
	            <p align="center"><span style="font-size:9pt;"></span></p>
	        </td>
	        <td bgcolor="">
				<p align="center"><span style="font-size:9pt;"></span></p>
	        </td>
	        <td bgcolor="">
	            <p align="center"><span style="font-size:9pt;"></span></p>
	        </td>
	        <td bgcolor="">
	            <p align="center"><span style="font-size:9pt;"></span></p>
	        </td>
	    </tr>
	</table>
</body>
</html>