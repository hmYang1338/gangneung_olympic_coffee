<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
	<form action="insertManager.do" method="post" id="insertManager" name="insertManager" role="form">
	<hr class="hr-white">
	<h3 class="blue text-center">운영자 계정 생성</h3><hr class="hr-white">
		<!-- 이메일 -->
		<label for="email" class="control-label blue">이 메 일&nbsp;:&nbsp;</label>
		<input type="email" name="email" id="email" maxlength="30" placeholder="Email" class="form-control input-lg blue" required="required"/><br> 
		
		<!-- 비밀번호 -->
		<label for="password" class="control-label blue">비밀번호&nbsp;:&nbsp;</label>
		<input type="password" name="password" id="password" maxlength="16" placeholder="password" class="form-control input-lg blue" required="required"/><br> 
		
		<!-- 이름 -->
		<label for="name" class="control-label blue">이 름&nbsp;:&nbsp;</label>
		<input type="text" id="name" name="name" maxlength="20" class="form-control input-lg blue" placeholder="Enter Name" required="required"><br> 
		
		<!-- 전화번호 -->
		<label for="tel" class="control-label blue">전화번호&nbsp;:&nbsp;</label>
		<input type="tel" id="tel" name="tel" class="form-control input-lg blue" placeholder="Enter CellPhone Number" maxlength="20"><br>
		
		
		<!-- 생년월일 -->
		<label for="birth" class="control-label blue"><spring:message code="site.member.birthday"/>&nbsp;:&nbsp;</label>
		<input type="date" id="birth" name="birth" class="form-control input-lg blue" value="1992-01-01" min="1917-01-01" max="2017-11-24" title='<spring:message code="site.member.birthday"/>' required="required"><br>
		
		<!-- 언어 설정 -->
		<label for="lanCode" class="control-label blue"><spring:message code="site.member.language"/>&nbsp;:&nbsp;</label>
	 	<%-- <select name="lanCode" id="lanCode" class="form-control input-lg blue" required="required">
	 	  <c:if test="${not empty requestScope.languageList}">
	 		<c:forEach var="language" items="${requestScope.languageList}">
	 		  <option value="${language.lanCode}">${language.language}</option>
	 		</c:forEach>
	 	  </c:if>
		</select> --%>
		<input type="text" id="lanCode" name="lanCode" maxlength="2" class="form-control input-lg blue" placeholder="Enter languageCode" required="required"><br>
		<br>
		
		<!-- Store ID -->
		<label for="id" class="control-label blue">카 페 ID&nbsp;:&nbsp;</label>
		<input type="text" id="id" name="id" maxlength="20" class="form-control input-lg blue" placeholder="Enter Store ID" required="required"><br>  
		
		<!-- 프로필 사진 -->
		<label for="imgDir" class="control-label blue"><spring:message code="site.member.profileimg"/>&nbsp;:&nbsp;</label>
		<input type="text" id="imgDir" name="imgDir" class="form-control input-lg blue" placeholder='<spring:message code="site.member.profileimg"/>'>
		<!-- text가 아닌 파일 업로드로 변환 필요 -->
		<br>
	
		<!-- Major -->
		<label for="major" class="control-label blue">Major&nbsp;:&nbsp;</label>
		<input type="text" name="major" id="major" class="form-control input-lg blue" placeholder="Enter Major"/><br> 
		
		<input type="button" class="btn btn-default pull-right btn-bottom-margin" id="button" value="운영자 등록" onclick="checking();">
		<hr>
	</form>
	
	<script type="text/javascript">
		function nowDate(){
			document.getElementById('birth').value = new Date().toDateInputValue();
		}
		
		var emailCheck = false;
		var nameCheck = false;

		/* 이메일 패턴 설정 */
		function validateEmail(email) {
			var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			return re.test(email);
		}

		/* 이메일 패턴 확인 */
		function checkEmail() {
			var email = document.getElementById("email").value;
			if (validateEmail(email)) {
				emailCheck = true;
			} else {
				emailCheck = false;
				alert("올바른 이메일을 입력하여 주세요.");
			}
		}

		/* 이름 확인 - NULL 불가 */
		function checkName() {
			var name = document.getElementById("name").value;
			if (name.length > 0) {
				nameCheck = true;
			} else {
				nameCheck = false;
				alert("올바른 이름을 입력하여 주세요");
			}
		}

		function checking() {
			checkEmail();
			checkName();
			
			if (emailCheck && nameCheck) {
				alert("운영자 계정 생성 완료!");
				document.getElementById("insertManager").submit();
			} else {
				alert("운영자 계정 생성에 실패하였습니다.");
			}
		}
	</script>
</body>
</html>