<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script language=javascript>
	/* function sendUpdate(){
		document.requestForm.action ="www/test2.do/go/elec.do/updateForm";
		document.requestForm.submit();
	}	
	
	function sendDelete(){
		document.requestForm.action ="go/elec.do/delete";
		document.requestForm.submit();			
	}	 */
</script>
</head>
<body>
	<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
	    <tr>
	        <td width="100" height="20">
	            <p align="right"><b><span style="font-size:9pt;">�̸���</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;"><b>
	        		${sessionScope.resultContent.email}</b>
	        	</span>
	        </td>
	    </tr>
	    <tr>
	        <td width="100" height="20">
	            <p align="right"><b><span style="font-size:9pt;">�̸�</span></b></p>
	        </td>
	        <td width="300" height="20">
	        	<span style="font-size:9pt;"><b>
	        		${sessionScope.resultContent.name}</b>
	        	</span>
	        </td>
	    </tr>
	    <tr>
	        <td width="100" height="20">
	            <p align="right"><b><span style="font-size:9pt;">ī�� �̸�</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;"><b>
					${sessionScope.resultContent.price}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="200" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">�޴���</span></b></p>
	        </td>
	        <td width="450" height="200" colspan="3">
	        	<span style="font-size:9pt;"><b>
					${sessionScope.resultContent.description}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="200" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">ī�� ��ȭ</span></b></p>
	        </td>
	        <td width="450" height="200" colspan="3">
	        	<span style="font-size:9pt;"><b>
					${sessionScope.resultContent.description}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="200" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">�ּ�</span></b></p>
	        </td>
	        <td width="450" height="200" colspan="3">
	        	<span style="font-size:9pt;"><b>
					${sessionScope.resultContent.description}</b>
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
								<input type=hidden name="modelNum" value="${sessionScope.resultContent.modelNum}">
								<input type=button value="�����ϱ�" onClick="sendUpdate()">
								<input type=button value="�����ϱ�" onClick="sendDelete()">
							</form>
						</td>
					</tr>
				</table>
			</td>
	    </tr>
	</table>
</body>
</html>