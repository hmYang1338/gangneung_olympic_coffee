<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
	<h1>��� ���� ����(insert)</h1>
	<form class="form-group brown" action='<c:url value="insertManager.do"/>' method="post" id="insertManager" name="insertManager">
		<p align="left" style="color: blue;">�� �� �� : </p>
		<input type="text" name="email" id="email" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">��й�ȣ : </p>
		<input type="password" name="password" id="password" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">��    �� : </p>
		<input type="text" name="name" id="name" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">��ȭ��ȣ : </p>
		<input type="text" name="tel" id="tel" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">������� : </p>
		<input type="text" name="birth" id="birth" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">����ڵ� : </p>
		<input type="text" name="lanCode" id="lanCode" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">ī �� ID : </p>
		<input type="text" name="id" id="id" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">�� �� �� : </p>
		<input type="text" name="imgDir" id="imgDir" class="form-control input-lg blue"/><br> 
		<p align="left" style="color: blue;">Major : </p>
		<input type="text" name="major" id="major" class="form-control input-lg blue"/><br> 
		
		<input class="btn btn-default blue blue-background radius" type="submit" value="��� ���" onclick="shin()">
		<hr>
	</form>
	</div>
	</div>
	
	<div class="col-lg-6">
		<div class="well bs-component live-less-edior-hovercontainer" 
		data-relatedvars="legend-color,legend-border-color,input-color,input-height-base,input-bg,input-border,input-border-radius,input-border-focus,input-color-placeholder,input-bg-disabled,input-height-small,input-height-large,state-success-text,state-success-bg,state-warning-text,state-warning-bg,state-danger-text,state-danger-bg,input-group-addon-bg,input-group-addon-border-color,input-border-radius-large,input-border-radius-small">
			<form class="form-horizontal">
				<fieldset>
					<legend>��� ���� ����</legend>
					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">Email</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="inputEmail" placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">Email</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="inputEmail" placeholder="Email">
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	<script type="text/javascript">
		var emailCheck = false;
		var nameCheck = false;

		/* �̸��� ���� ���� */
		function validateEmail(email) {
			var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			return re.test(email);
		}

		/* �̸��� ���� Ȯ�� */
		function checkEmail() {
			var email = document.getElementById("email").value;
			if (validateEmail(email)) {
				emailCheck = true;
			} else {
				emailCheck = false;
				alert("�ùٸ� �̸����� �Է��Ͽ� �ּ���.");
			}
		}

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
			checkEmail();
			checkName();
			console.log("managerInsert Test1");

			if (emailCheck && nameCheck) {
				console.log("managerInsert Test2");
				document.getElementById("insertManager").submit();
			} else {
				alert("ȸ�����Կ� �����Ͽ����ϴ�.");
			}
		}
	</script>
</body>
</html>