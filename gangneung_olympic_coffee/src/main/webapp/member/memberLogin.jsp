<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Member</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	.brown-background{
		background: #f2e6d9;
	}
	.brown{
		color: #996633;
	}
	.blue-background{
		background: #f0f0f5;
	}
	.blue{
		color: #666699;
	}
 	.green-background{ 
 		background: #daffda; 
 	} 
 	.green{ 
 		color: #009933; 
 	} 
	.radius{
		border-width: 3px;
		border-color: white;
	}
	.radius:hover{
		background-color:white;
		color:black;
	}
	
	.raio-group{
		margin-left: 10%;
		margin-bottom: 1px;
	}
	
	.hr-white{
		border-top: 3px solid #f8f9fa;
	}
	
	/* 아래부터는 재정의 */
	.control-label{
	    cursor: default;
	    font-size: large;
	}
	.pull-right {
	    float: right!important;
	    margin-right: 20px;
	}
</style>

</head>
<body>

	<!-- 로그인 구현 -->
		<div class="container">
		<div class="col-xs-10 col-sm-8 col-md-8 col-lg-8 blue-background">
		<form action="loginPage.do" method="POST"><br>
			<hr class="hr-white">
			<h3 class="blue text-center"> Login </h3><hr class="hr-white">
				<div class="form-group">
					<label for="email" class="control-label blue">Email&nbsp;:&nbsp;</label>
					<input type="email" id="email" name="email" maxlength="30" placeholder="Enter Email" class="form-control input-lg blue" required="required">
				</div><br>
				
				<!-- 비밀번호 -->
				<div class="form-group">
					<label for="password" class="control-label blue">PassWord&nbsp;:&nbsp;</label>
					<input type="password" id="password" name="password" maxlength="16" placeholder="Enter Password" class="form-control input-lg blue" required="required"><br>
					<!--  -->
					<input class="btn btn-danger btn pull-right" type="reset" value="Reset">
					<!-- 로그인 버튼(Submit) -->
					<input class="btn btn-primary btn pull-right" type="submit" value="Login">
				<br></div><br>
		</form>
		</div>
		</div>
	<br>

</body>
</html>