<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>카페 정보 수정</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.brown-background {
	background: #f2e6d9;
}

.brown {
	color: #996633;
}

.blue-background {
	background: #f0f0f5;
}

.blue {
	color: #666699;
}
/*  	.green-background{ 
 		background: #daffda; 
	} 
	.green{ 
		color: #009933; 
	} */
.radius {
	border-width: 3px;
	border-color: white;
}

.radius:hover {
	background-color: white;
	color: black;
}
</style>
</head>
<body>
	<br>
	<div class="container col-centered text-center">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 blue-background">
			<h3 class="">카페 정보 수정</h3>
			<form class="form-group blue" action="" method="">
				<p align="left">카페명 : </p>
				<input type="text" class="form-control input-lg blue"> <br> 
				<button class="btn btn-default blue blue-background radius" type="submit">검색</button>
			</form>
		</div>
	</div>
	<%-- 
	<form name=updateForm method=post action="updateManager.do" onSubmit='return checkValid()'>
		<input type="hidden" name="email" value="${resultContent.email}"/>
		<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    		<tr>
        		<td width="150" height="20">
            		<p align="right"><b><span style="font-size:9pt;">카페 ID</span></b></p>
        		</td>
        		<td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.email}</span></b></p>
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
		        	<b><span style="font-size:9pt;">
							<input type=text name="tel" size="50" value="${resultContent.tel}">					
					</span></b>
				</td>
		    </tr>
		    <tr>
		        <td width="150" height="20" >
		            <p align="right"><b><span style="font-size:9pt;">전화번호</span></b></p>
		        </td>
				<td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.s_name}</span></b></p>
				</td>
		    </tr>
		     <tr>
		        <td width="150" height="20" >
		            <p align="right"><b><span style="font-size:9pt;">운영시간</span></b></p>
		        </td>
				<td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.s_addr}</span></b></p>
				</td>
		    </tr>
		     <tr>
		        <td width="150" height="20" >
		            <p align="right"><b><span style="font-size:9pt;">언어코드</span></b></p>
		        </td>
		        <td width="450" height="20">
					<p align="center"><b><span style="font-size:9pt;">${resultContent.s_tel}</span></b></p>
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
	</form> --%>
	
	<div id="storeListView">
	</div>

<script src="js/ajax/httpRequest.js"></script>
	
</body>
</html>