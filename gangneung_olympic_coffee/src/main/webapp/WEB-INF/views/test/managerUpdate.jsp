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
	<form name=updateForm method=post action="update.do" onSubmit='return checkValid()'>
		<input type="hidden" name="email" value="${resultContent.email}"/>
		<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    		<tr>
        		<td width="150" height="20">
            		<p align="right"><b><span style="font-size:9pt;">모델 번호</span></b></p>
        		</td>
        		<td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.modelNum}</span></b></p>
				</td>
    		</tr>
		    <tr>
		        <td width="150" height="20">
		            <p align="right"><b><span style="font-size:9pt;">모델 이름</span></b></p>
		        </td>
				<td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.modelName}</span></b></p>
				</td>
		    </tr>
		    <tr>
		        <td width="150" height="20">
		            <p align="right"><b><span style="font-size:9pt;">가  격</span></b></p>
		        </td>
		        <td width="450" height="20">
		        	<b><span style="font-size:9pt;">
							<input type=text name="price" size="50" value="${resultContent.price}">					
					</span></b>
				</td>
		    </tr>
		    <tr>
		        <td width="150" height="20" >
		            <p align="right"><b><span style="font-size:9pt;">비  고</span></b></p>
		        </td>
				<td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.description}</span></b></p>
				</td>
		    </tr>
		    <tr>
		        <td width="150" height="20">
		            <p align="right"><b><span style="font-size:9pt;">&nbsp;</span></b></p>
		        </td>
		        <td width="450" height="20">
		        	<b><span style="font-size:9pt;">
						<input type="submit" value="수정하기"><input type="reset" value="다시쓰기">
					</span></b>
				</td>
		    </tr>
		</table>
	</form>
</body>
</html>