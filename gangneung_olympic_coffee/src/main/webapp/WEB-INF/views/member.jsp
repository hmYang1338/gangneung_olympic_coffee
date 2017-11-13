<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Contenvt-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Join Member</title>

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="../vendor/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<form method="POST" id="joinMember" name="joinMember"
		action="insertMember.do">
		<input type="hidden" name="email" id="email" value="aaaa@aaaa.aa">
		<input type="hidden" name="password" id="password" value="abcdefgh">
		<input type="hidden" name="password2" id="password2" value="abcdefgh">
		<input type="hidden" name="name" id="name" value="sakatari">
		<input type="hidden" name="tel" id="tel" value="000-0000-0000">
		<input type="hidden" name="gender" id="gender" value="1">
		<input type="date" name="birth" id="birth">
		<input type="hidden" name="nationCode" id="nationCode" value="11">
		<input type="button" name="button" id="button" value="submit" onclick="shin1();">
	</form>

	<script type="text/javascript">
	
		var emailCheck = false;
		var passwordCheck = false;
		var passwordLengthCheck = false;
		var nameCheck = false;
		//var genderCheck = false;
		//var birthCheck = false;
	
		/* 비밀번호 재확인 글 나오기  */
		function shin1() {
			var pw1 = document.getElementById("password").value;
    		var pw2 = document.getElementById("password2").value;
    		if(pw1.length>=8&&pw2.length>=8){
    			if(pw1==pw2){
					document.getElementById("joinMember").submit();
    				
    			}else{
    				console.log("안되!");
    			}
    		}else{
   				console.log("안되!");
    		}
		}
	</script>

	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.js"></script>
	<script src="../vendor/popper/popper.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.js"></script>
</body>
</html>