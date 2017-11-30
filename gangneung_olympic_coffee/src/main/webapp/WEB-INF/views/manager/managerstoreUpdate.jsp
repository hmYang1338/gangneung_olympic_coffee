<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name=updateForm method=post action="updateStore.do" onSubmit='return checkValid()'>
		<input type="hidden" name="id" value="${resultContent.id}"/>
		<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    		<tr>
        		<td width="150" height="20">
            		<p align="right"><b><span style="font-size:9pt;">ID</span></b></p>
        		</td>
        		<td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.id}</span></b></p>
				</td>
    		</tr>
		    <tr>
		        <td width="150" height="20">
		            <p align="right"><b><span style="font-size:9pt;">이름</span></b></p>
		        </td>
				<td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.name}</span></b></p>
				</td>
		    </tr>
		    <tr>
		        <td width="150" height="20">
		            <p align="right"><b><span style="font-size:9pt;">주소</span></b></p>
		        </td>
		        <td width="450" height="20">
		        	<p align="center"><b><span style="font-size:9pt;">${resultContent.addr}</span></b></p>
				</td>
		    </tr>
		    <tr>
		        <td width="150" height="20" >
		            <p align="right"><b><span style="font-size:9pt;">전화번호</span></b></p>
		        </td>
				<td width="450" height="20">
					<b><span style="font-size:9pt;">
						<input type=text name="tel" size="50" value="${resultContent.tel}">					
					</span></b>
				</td>
		    </tr>
		     <tr>
		        <td width="150" height="20" >
		            <p align="right"><b><span style="font-size:9pt;">운영시간</span></b></p>
		        </td>
				<td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.storeHours}</span></b></p>
				</td>
		    </tr>
		     <tr>
		        <td width="150" height="20" >
		            <p align="right"><b><span style="font-size:9pt;">언어코드</span></b></p>
		        </td>
		        <td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.lanCode}</span></b></p>
				</td>
		    </tr>
		    <tr>
		        <td width="150" height="20" >
		            <p align="right"><b><span style="font-size:9pt;">경도</span></b></p>
		        </td>
		        <td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.longi}</span></b></p>
				</td>
		    </tr>
		    <tr>
		        <td width="150" height="20" >
		            <p align="right"><b><span style="font-size:9pt;">위도</span></b></p>
		        </td>
		        <td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.lat}</span></b></p>
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