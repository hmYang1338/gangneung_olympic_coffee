<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	            <p align="right"><b><span style="font-size:9pt;">ID</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.id}</b>
	        	</span>
	        </td>
	    </tr>
	    <tr>
	        <td width="100" height="20">
	            <p align="right"><b><span style="font-size:9pt;">이름</span></b></p>
	        </td>
	         <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.name}</b>
	        	</span>
	        </td>
	    </tr>
	    <tr>
	        <td width="100" height="20">
	            <p align="right"><b><span style="font-size:9pt;">주소</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.addr}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="20" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">전화 번호</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.tel}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="20" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">운영 시간</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.storeHours}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="20" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">언어코드</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.lanCode}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="20" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">경도</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.lat}</b>
				</span>
			</td>
	    </tr>
	    <tr>
			<td width="100" height="20" valign="top">
	            <p align="right"><b><span style="font-size:9pt;">위도</span></b></p>
	        </td>
	        <td width="450" height="20" colspan="3">
	        	<span style="font-size:9pt;">
	        		<b>${sessionScope.resultContent.longi}</b>
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
							<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
							<form name="requestForm" method=post>
								<input type=hidden name="id" value="${sessionScope.resultContent.id}">
								<input type=button value="수정하기" onClick="sendUpdate()">
								<input type=button value="삭제하기" onClick="sendDelete()">
							</form> 
						</td>
					</tr>
				</table>
			</td>
	    </tr>
	</table>
	<script language=javascript>
	function sendUpdate(){
		document.requestForm.action ="../updateStoreForm.do";
		document.requestForm.submit();
	}	
	
	function sendDelete(){
		document.requestForm.action ="../deleteStore.do";
		document.requestForm.submit();			
	}	 
	</script>
</body>
</html>