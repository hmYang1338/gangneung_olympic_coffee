<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Join Member</title>

	<!-- Bootstrap core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	<!-- Custom fonts for this template -->
	<link href="../vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

</head>
<body>
	<input type="email" id="email" name="email" maxlength="30" placeholder="이메일 입력해주세요" required="required"><br>
	<input type="password" id="password1" name="password" maxlength="16" placeholder="비밀번호를 입력해주세요" required="required" onchange="compare()"><br>
	<input type="password" id="password2" maxlength="16" placeholder="비밀번호를 재확인해주세요" required="required" onchange="compare()"><br>
	<div id="alert"></div>
	<!-- Nation(나라)를 설정 -->
<%-- 	<select required="required">
	  <c:if test="${not empty requestScope.nationList}">
		<c:forEach var="nation" items="${requestScope.nationList}">
		  <option value="${nation.nationCode}">${nation.nation}</option>
		</c:forEach>
	  </c:if>
	</select>
	<br>
	<!-- 언어를 설정 -->
	<select required="required">
	  <c:if test="${not empty requestScope.languageList}">
		<c:forEach var="language" items="${requestScope.languageList}">
		  <option value="${language.lanCode}">${language.language}</option>
		</c:forEach>
	  </c:if>
	</select> --%>
	<!-- 이름 -->
	<br>
	<input type="text" id="name" name="name" maxlength="20" placeholder="이름을 입력해주세요" required="required"><br>
	<input type="radio" id="gender1" name="gender" value="1">남&nbsp;&nbsp;&nbsp;
	<input type="radio" id="gender2" name="gender" value="2">여<br>
	<input type="date" id="birth" name="birth" title="생일을 입력해주세요" required="required"><br>
	<!-- 이미지 업로드 해야하는 것 만들어야함 -->
	<button onclick="shin1()">Submit</button>
	
	
	<script type="text/javascript">
	
	var emailCheck = false;
	var passwordCheck = false;
	var passwordLengthCheck = false;
	var nameCheck = false;
	//var genderCheck = false;
	//var birthCheck = false;
	
		/* 비밀번호 재확인 글 나오기  */
    	function compare(){
    		var alert = document.getElementById("alert");
    		var pw1 = document.getElementById("password1").value;
    		var pw2 = document.getElementById("password2").value;
    		if(pw1.length>=8&&pw2.length>=8){
    			passwordLengthCheck = true;
	    		if(pw1!=pw2){
	    			passwordCheck = false;
	    			alert.innerHTML = "<font color='red'>일치하지 않습니다</font>";
	    		} else {
	    			passwordCheck = true;
	    			alert.innerHTML = "<font color='green'>일치합니다</font>";
	    		}
    		}else{
    			passwordLengthCheck = false;
    			alert.innerHTML = "<font color='red'>비밀번호는 8자 이상입니다.</font>";
    		}
    	}
		
    	/* 이메일 패턴 설정 */
    	function validateEmail(email) {
    		  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    		  return re.test(email);
   		}
    	
    	/* 이메일 패턴 확인 */
    	function checkEmail(){
    		var email = document.getElementById("email").value;
    		if(validateEmail(email)){
    			emailCheck = true;
    		}else{
    			emailCheck = false;
    			alert("올바른 이메일을 입력하여 주세요.");
    		}
    	}
    
    	/* 이름 확인 - NULL 불가 */
    	function checkName(){
    		var name = document.getElementById("name").value;
    		if(name.length>0){
    			nameCheck = true;
    		}else{
    			nameCheck = false;
    			alert("올바른 이름을 입력하여 주세요");
    		}
    	}
    	/*
    	// 성별 확인 - 보안성  
    	function checkGender(){
    		var radioVal = $(':radio[name="gender"]:checked').val();
    		var gender1 = document.getElementsById("gender1").value;
    		var gender2 = document.getElementsById("gender2").value;
    		if(radioVal=='1'||radioVal=='2'){
    			genderCheck = true;
    			console.log("들어갔다");
    		}else{
    			genderCheck = false;
    			alert("성별을 선택하여 주세요");
    		}
    	}
    	
    	// 생년월일 확인 
    	function checkBirth(){
    		var birth = document.getElementsById("birth").value;
    		if(birth.length>0){
    			birthCheck = true;
    		}else{
    			birthCheck = false;
    			alert("생일을 선택하여 주세요");
    		}
    	}
    	*/
    	function shin1(){
    		checkEmail();
    		checkName();
    		//checkGender();
    		//checkBirth();
    		
    		//emailCheck&&passwordCheck&&passwordLengthCheck&&nameCheck&&genderCheck&&birthCheck
    		if(emailCheck&&passwordCheck&&passwordLengthCheck&&nameCheck){
    			alert("회원가입을 축하드립니다.");
    			location.href="index.jsp";
    		}else{
    			alert("회원가입에 실패하였습니다.");
    		}
    	}
    	
    </script>

	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.js"></script>
	<script src="../vendor/popper/popper.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.js"></script>
</body>
</html>