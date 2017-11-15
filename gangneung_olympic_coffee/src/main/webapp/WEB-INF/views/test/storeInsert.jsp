<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ī�� ���� ���</title>
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
	<div class="container col-centered text-center">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 blue-background">
	<h1>ī�� ���� �Է�</h1>
	<form class="form-group brown" name="insertStore"  method="post" action="insertStore.do" id="insertStore">
		<p align="left" style="color: blue;">ī �� ID : </p>
		<input type="text" name="id" id="id" class="form-control input-lg blue"/><br>
		<p align="left" style="color: blue;">��	   �� : </p>
		<input type="text" name="name" id="name" class="form-control input-lg blue"/><br>
		<p align="left" style="color: blue;">��    �� : </p>
		<input type="text" name="addr" id="addr" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">��ȭ��ȣ : </p>
		<input type="text" name="tel" id="tel" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">��ð� : </p>
		<input type="text" name="storeHours" id="storeHours" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">����ڵ� : </p>
		<input type="text" name="lanCode" id="lanCode" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">��    �� : </p>
		<input type="text" name="longi" id="longi" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">��    �� : </p>
		<input type="text" name="lat" id="lat" class="form-control input-lg blue"/><br> 
		<input class="btn btn-default blue blue-background radius" type="submit" value="ī�� ���" onclick="shin1()">
		<hr>
	</form>
	</div>
	</div>
	
	<script type="text/javascript">
		/* �̸� Ȯ�� - NULL �Ұ� */
		function checkName() {
			var name = document.getElementById("name").value;
			if (name.length > 0) {
				nameCheck = true;
			} else {
				nameCheck = false;
				alert("�ùٸ� �̸��� �Է��Ͽ� �ּ���");
			}
		}
	
		function shin1() {
			checkName();
			console.log("storeInsert Test1");
	
			if (nameCheck) {
				console.log("storeInsert Test2");
				document.getElementById("insertStore").submit();
			} else {
				alert("ȸ�����Կ� �����Ͽ����ϴ�.");
			}
		}
	</script>
</body>
</html>