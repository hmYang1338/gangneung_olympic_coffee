<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
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
/* 	.green-background{ */
/* 		background: #daffda; */
/* 	} */
/* 	.green{ */
/* 		color: #009933; */
/* 	} */
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

	<!-- 회원 정보 수정 -->
	<div class="container">
		<div class="col-xs-10 col-sm-8 col-md-8 col-lg-8 blue-background">
			
			<form method="POST" id="updateMember" name="updateMember" action="updateMember.do">
			<br>
			<hr class="hr-white">
			<h3 class="blue text-center"> Update Member </h3><hr class="hr-white">
				
				<!-- 회원 Email -->
				<div class="form-group">
					<label for="email" class="control-label blue">Email&nbsp;:&nbsp;</label>
					<input type="hidden" name="email" value="${memberSession.email}">
					<p class="form-control-static">${memberSession.email}</p>
				</div><br>
				
				<!-- 회원 기존 Password -->
				<div class="form-group">
					<label for="passwordBefore" class="control-label blue">Before PassWord&nbsp;:&nbsp;</label>
					<input type="password" name="passwordBefore" maxlength="16" placeholder="Enter Before Password" class="form-control input-lg blue"><br>
				</div><br>
				
				<!-- 회원 변경 Password -->
				<div class="form-group">
					<label for="password" class="control-label blue">Update PassWord&nbsp;:&nbsp;</label>
					<input type="password" id="password" name="password" maxlength="16" placeholder="Enter Update Password" class="form-control input-lg blue" onchange="compare()"><br>
					<input type="password" id="password2" name="password2" maxlength="16" placeholder="Reconfirm Update Password" class="form-control input-lg blue" onchange="compare()">
					<div id="alert"></div>
				</div><br>
				
				<!-- 회원 국가 변경 -->
				<div class="form-group">
					<label for="nationCode" class="control-label blue">Update Nation&nbsp;:&nbsp;</label>
					<select name="nationCode" id="nationCode">
					  <c:if test="${not empty requestScope.nationList}">
						<c:forEach items="${requestScope.nationList}" var="nation" >
						  <option value="${nation.nationCode}">${nation.nation}</option>
						</c:forEach>
					  </c:if>
					</select>
					</div><br>
					
					<!-- 회원 언어 변경 -->
					<div class="form-group">
						<label for="lanCode" class="control-label blue">Update Language&nbsp;:&nbsp;</label>
					 	<select name="lanCode" id="lanCode" required="required">
					 	  <c:if test="${not empty requestScope.languageList}"><!-- not empty일 때 설정 필요 -->
					 		<c:forEach var="language" items="${requestScope.languageList}">
					 		  <option value="${language.lanCode}">${language.language}</option>
					 		</c:forEach>
					 	  </c:if>
						</select>
					</div><br>
					
					<!-- 회원 이름 변경 -->
					<div class="form-group">
						<label for="lanCode" class="control-label blue">Update Name&nbsp;:&nbsp;</label>
						<input type="text" id="name" name="name" maxlength="20" value="${memberSession.name}" required="required">
					</div><br>
					
					<!-- 회원 국가 변경 -->
					<div class="form-group">
						<label for="lanCode" class="control-label blue">Update CellPhone&nbsp;:&nbsp;</label>
						<input type="tel" id="tel" name="tel" maxlength="20" value="${memberSession.tel}">
					</div><br>
					
					<!-- 회원 성별 변경 -->
					<!-- memberSession.gender==1 일 때 checked Male, memeberSession.gender==2일 때 checked Female -->
					<label for="gender" class="control-label blue">Gender&nbsp;:&nbsp;</label>
					<c:if test="${memberSession.gender eq 1}">
					<div class="raio-group">
						<label class="custom-control custom-radio">
						  <input id="gender" name="gender" type="radio" class="custom-control-input" value="1" checked="checked">
						  <span class="custom-control-indicator"></span>
						  <span class="custom-control-description">Male</span>
						</label><br>
						<label class="custom-control custom-radio">
						  <input id="gender" name="gender" type="radio" class="custom-control-input" value="2">
						  <span class="custom-control-indicator"></span>
						  <span class="custom-control-description">Female</span>
						</label>
					</div><br>
					</c:if>
				
					<c:if test="${memberSession.gender eq 2}">
					<div class="raio-group">
						<label class="custom-control custom-radio">
						  <input id="gender" name="gender" type="radio" class="custom-control-input" value="1">
						  <span class="custom-control-indicator"></span>
						  <span class="custom-control-description">Male</span>
						</label><br>
						<label class="custom-control custom-radio">
						  <input id="gender" name="gender" type="radio" class="custom-control-input" value="2" checked="checked">
						  <span class="custom-control-indicator"></span>
						  <span class="custom-control-description">Female</span>
						</label>
					</div><br>
					</c:if>
				
					
					
					<input type="date" id="birth" name="birth" value="${memberSession.birth}" required="required"><br>
					<input type="text" id="imgDir" name="imgDir" value="${memberSession.imgDir}"><br>
					<input type="submit" value="변경">
			</form>
			
		</div>
	</div>
	
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
    		var pw1 = document.getElementById("password").value;
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
    			console.log("들어감1");
    		//checkGender();
    		//checkBirth();
    		
    		//emailCheck&&passwordCheck&&passwordLengthCheck&&nameCheck&&genderCheck&&birthCheck
    		if(emailCheck&&passwordCheck&&passwordLengthCheck&&nameCheck){
    			//alert("회원가입을 축하드립니다.");
    			console.log("들어감2");
    			document.getElementById("joinMember").submit();
    		}else{
    			alert("회원가입에 실패하였습니다.");
    		}
    	}
    	
    </script>

</body>
</html>