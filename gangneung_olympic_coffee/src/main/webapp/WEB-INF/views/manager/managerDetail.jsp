<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
		<tr>
	        <td width="100" height="20">
	            <p align="right"><b><span style="font-size:9pt;">�̸���</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.email}</b>
	        	</span>
	        </td>
	    </tr>
	    <tr>
	        <td width="100" height="20">
	            <p align="right"><b><span style="font-size:9pt;">�̸�</span></b></p>
	        </td>
	         <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.name}</b>
	        	</span>
	        </td>
	    </tr>
	    <tr>
	        <td width="100" height="20">
	            <p align="right"><b><span style="font-size:9pt;">�޴���</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.tel}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="20" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">ī�� �̸�</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.sName}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="20" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">�ּ�</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.sAddr}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="20" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">��ȭ��ȣ</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.sTel}</b>
				</span>
			</td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="right"><b><span style="font-size:9pt;">&nbsp;</span></b></p>
	        </td>
	        <td height="20" colspan="3">
		        <table>
					<tr>
						<td>
							<!-- ������ �ʿ��� �����͵��� hidden���� ���ܳ��� �� �����ͷ� �����ش�. -->
							<form name="requestForm" method=post>
								<input type=hidden name="email" value="${sessionScope.resultContent.email}">
								<input type=button value="�����ϱ�" onClick="sendUpdate()">
								<input type=button value="�����ϱ�" onClick="sendDelete()">
							</form> 
						</td>
					</tr>
				</table>
			</td>
	    </tr>
	</table>
	<script language=javascript>
	function sendUpdate(){
		document.requestForm.action ="../updateForm.do";
		document.requestForm.submit();
	}	
	
	function sendDelete(){
		document.requestForm.action ="../deleteManager.do";
		document.requestForm.submit();			
	}	 
	</script>
</body>
</html>