<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Member</title>
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

	<a href="selectMemberAll.do">리스트 보기</a>
	<a href="memberLogin.jsp">로그인</a>
	
	<br><hr><br>
	
	<!-- 회원 가입 구현 -->
	<div class="container">
		<div class="col-xs-10 col-sm-8 col-md-8 col-lg-8 blue-background">
			<form action="insertMember.do" id="joinMember" name="joinMember" role="form" method="POST"><br>
			<hr class="hr-white">
			<h3 class="blue text-center"> Member Join </h3><hr class="hr-white">
				<div class="form-group">
					<label for="email" class="control-label blue">Email&nbsp;:&nbsp;</label>
					<input type="email" id="email" name="email" maxlength="30" placeholder="Enter Email" class="form-control input-lg blue" required="required">
				</div><br>
				
				<!-- 비밀번호 -->
				<div class="form-group">
					<label for="password" class="control-label blue">PassWord&nbsp;:&nbsp;</label>
					<input type="password" id="password" name="password" maxlength="16" placeholder="Enter Password" class="form-control input-lg blue" required="required" onchange="compare()"><br>
					<input type="password" id="password2" name="password2" maxlength="16" placeholder="Reconfirm Password" class="form-control input-lg blue" required="required" onchange="compare()">
				<div id="alert"></div>
				</div><br>
				
				<!-- 국가 설정 -->
				<div class="form-group">
					<label for="nationCode" class="control-label blue">Nation&nbsp;:&nbsp;</label>
					<select name="nationCode" id="nationCode" class="form-control input-lg blue" required="required">
					  <c:if test="${not empty requestScope.nationList}">
						<c:forEach items="${requestScope.nationList}" var="nation" >
						  <option value="${nation.nationCode}">${nation.nation}</option>
						</c:forEach>
					  </c:if>
					</select>
				</div><br>
				
				<!-- 언어 설정 -->
				<div class="form-group">
					<label for="lanCode" class="control-label blue">Language&nbsp;:&nbsp;</label>
				 	<select name="lanCode" id="lanCode" class="form-control input-lg blue" required="required">
				 	  <c:if test="${not empty requestScope.languageList}">
				 		<c:forEach var="language" items="${requestScope.languageList}">
				 		  <option value="${language.lanCode}">${language.language}</option>
				 		</c:forEach>
				 	  </c:if>
					</select>
				</div><br>
				
				<!-- 이름 -->
				<div class="form-group">
					<label for="name" class="control-label blue">Name&nbsp;:&nbsp;</label>
					<input type="text" id="name" name="name" maxlength="20" class="form-control input-lg blue" placeholder="Enter Name" required="required">
				</div><br>
				
				<!-- 전화번호 -->
				<div class="form-group">
					<label for="tel" class="control-label blue">CellPhone&nbsp;:&nbsp;</label>
					<input type="tel" id="tel" name="tel" class="form-control input-lg blue" placeholder="Enter CellPhone Number" maxlength="20">
				</div><br>
				
				<!-- 성별 -->
					<label for="gender" class="control-label blue">Gender&nbsp;:&nbsp;</label>
					<div class="raio-group">
					<label class="custom-control custom-radio">
					  <input id="gender" name="gender" type="radio" class="custom-control-input" value="1">
					  <span class="custom-control-indicator"></span>
					  <span class="custom-control-description">Male</span>
					</label><br>
					<label class="custom-control custom-radio">
					  <input id="gender" name="gender" type="radio" class="custom-control-input" value="2">
					  <span class="custom-control-indicator"></span>
					  <span class="custom-control-description">Female</span>
					</label>
				</div><br>
				
				<!-- 생년월일 -->
				<div class="form-group">
					<label for="birth" class="control-label blue">BirthDay&nbsp;:&nbsp;</label>
					<input type="date" id="birth" name="birth" class="form-control input-lg blue" value="1992-01-01" min="1917-01-01" max="2017-11-15" title="Birth Day" required="required">
				</div><br>
				
				<!-- 프로필 사진 -->
				<div class="form-group">
					<label for="imgDir" class="control-label blue">Profile Image&nbsp;:&nbsp;</label>
					<input type="text" id="imgDir" name="imgDir" class="form-control input-lg blue" placeholder="Enter Your Profile Image">
				</div><br>
				
				<!-- 승인코드 -->
				<div class="form-group">
					<label for="imgDir" class="control-label blue">Profile Image&nbsp;:&nbsp;</label>
					<input type="text" id="accessCode" name="accessCode" class="form-control input-lg blue" title="accessCode">
					<br>
					<input type="button" class="btn btn-primary btn pull-right" id="button" value="submit" onclick="checking();">
				<br></div><br>
				
			
			</form>
		
		</div>
	</div>
	
	<!-- 회원가입 판별 -->
	<script type="text/javascript">
	function nowDate(){
		document.getElementById('birth').value = new Date().toDateInputValue();
	}

	
	var emailCheck = false;
	var passwordCheck = false;
	var passwordLengthCheck = false;
	var nameCheck = false;
	var genderCheck = false;
	
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
    		var email = document.getElementById("email").trim().value;
    		if(validateEmail(email)){
    			emailCheck = true;
    		}else{
    			emailCheck = false;
    			alert("올바른 이메일을 입력하여 주세요.");
    		}
    	}
    
    	/* 이름 확인 - NULL 불가 */
    	function checkName(){
    		var name = document.getElementById("name").trim().value;
    		if(name.length>0){
    			nameCheck = true;
    		}else{
    			nameCheck = false;
    			alert("올바른 이름을 입력하여 주세요");
    		}
    	}
    	
    	// 성별 확인 - 보안성  
    	function checkGender(){
    		var gender = document.getElementById("gender").value;
    		if(gender==1||gender==2){
    			genderCheck = true;
    		}else{
    			genderCheck = false;
    			alert("성별을 선택하여 주세요");
    		}
    	}
    	
    	function checking(){
    		checkEmail();
    		checkName();
    		checkGender();
    		
    		//emailCheck&&passwordCheck&&passwordLengthCheck&&nameCheck&&genderCheck&&birthCheck
    		if(emailCheck&&passwordCheck&&passwordLengthCheck&&nameCheck&&genderCheck){
    			alert("회원가입을 축하드립니다.");
    			document.getElementById("joinMember").submit();
    		}else{
    			alert("회원가입에 실패하였습니다.");
    		}
    	}
    	
    </script>
</body>
</html>