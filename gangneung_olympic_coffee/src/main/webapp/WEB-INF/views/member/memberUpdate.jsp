<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
	.btn-bottom-margin{
		margin-bottom: 20px;
	}
</style>
	<!-- 회원 정보 수정 -->
			<form id="updateMember" name="updateMember" action="updateMember.do" method="POST">
			<br>
			<hr class="hr-white">
			<h3 class="blue text-center"> Update Member </h3><hr class="hr-white">
				
				<!-- 회원 Email -->
					<label for="email" class="control-label blue">Email&nbsp;:&nbsp;</label>
					<input type="hidden" name="email" value="${memberSession.email}">
					<p class="form-control-static">${memberSession.email}</p>
				
				<br>
				
				<!-- 회원 기존 Password -->
					<label for="passwordBefore" class="control-label blue">Before PassWord&nbsp;:&nbsp;</label>
					<input type="password" name="passwordBefore" maxlength="16" placeholder="Enter Before Password" class="form-control input-lg blue"><br>
				
				<br>
				
				<!-- 회원 변경 Password -->
					<label for="password" class="control-label blue">Update PassWord&nbsp;:&nbsp;</label>
					<input type="password" id="password" name="password" maxlength="16" placeholder="Enter Update Password" class="form-control input-lg blue" onchange="compare()"><br>
					<input type="password" id="password2" name="password2" maxlength="16" placeholder="Reconfirm Update Password" class="form-control input-lg blue" onchange="compare()">
					<div id="alert"></div>
				
				<br>
				
				<!-- 회원 국가 변경 -->
					<label for="nationCode" class="control-label blue">Update Nation&nbsp;:&nbsp;</label>
					<select name="nationCode" id="nationCode" class="form-control input-lg blue" required="required">
					  <c:if test="${not empty requestScope.nationList}">
						<c:forEach items="${requestScope.nationList}" var="nation" >
					  <%-- <option selected="selected" value="${memberSession.nationCode}">${memberSession.nation}</option> --%>
						  <option value="${nation.nationCode}">${nation.nation}</option>
						</c:forEach>
					  </c:if>
					</select>
				
				<br>
					
					<!-- 회원 언어 변경 -->
						<label for="lanCode" class="control-label blue">Update Language&nbsp;:&nbsp;</label>
					 	<select name="lanCode" id="lanCode" class="form-control input-lg blue">
					 	  <c:if test="${not empty requestScope.languageList}">
					 	 <%--  <option selected="selected" value="${memberSession.languageCode}">${memberSession.language}</option> --%>
					 		<c:forEach var="language" items="${requestScope.languageList}">
					 		  <option value="${language.lanCode}">${language.language}</option>
					 		</c:forEach>
					 	  </c:if>
						</select>
				
				<br>
					
					<!-- 회원 이름 변경 -->
						<label for="lanCode" class="control-label blue">Update Name&nbsp;:&nbsp;</label>
						<input type="text" id="name" name="name" class="form-control input-lg blue" maxlength="20" value="${memberSession.name}" required="required">
				
				<br>
					
					<!-- 회원 국가 변경 -->
						<label for="lanCode" class="control-label blue">Update CellPhone&nbsp;:&nbsp;</label>
						<input type="tel" id="tel" name="tel" class="form-control input-lg blue" maxlength="20" value="${memberSession.tel}">
				
				<br>
					
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
				
					
					
					<input type="text" id="imgDir" class="form-control input-lg blue" name="imgDir" value="${memberSession.imgDir}">
				
				<br>
				
					<input type="button" class="btn-bottom-margin" value="변경" onclick="updateChecking()">
			
			</form>

			
			
			
			
	<!-- 회원가입 판별 -->
	<script type="text/javascript">

	
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
    
    	/* 이름 확인 - NULL 불가 */
    	function checkName(){
    		var name = document.getElementById("name").value;
    		if(name.length>0){
    			console.log("이메일 확인 들어감");//test
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
    	
    	function updateChecking(){
    		checkName();
    		checkGender();
    		
    		//emailCheck&&passwordCheck&&passwordLengthCheck&&nameCheck&&genderCheck&&birthCheck
    		if(passwordCheck&&passwordLengthCheck&&nameCheck&&genderCheck){
    			alert("회원정보 수정을 완료하였습니다.");
    			document.getElementById("updateMember").submit();
    		}else{
    			alert("회원정보 수정에 실패하였습니다.");
    		}
    	}
    	
    </script>