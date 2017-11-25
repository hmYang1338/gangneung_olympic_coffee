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
	<form action='<c:url value="insertStore.do"/>' method="post" id="insertStore" name="insertStore" role="form">
	<hr class="hr-white">
	<h3 class="blue text-center">카페 등록</h3><hr class="hr-white">
		<!-- Store ID -->
		<label for="id" class="control-label blue">카 페 ID&nbsp;:&nbsp;</label>
		<input type="text" id="id" name="id" maxlength="20" class="form-control input-lg blue" placeholder="Enter Store ID" required="required"><br>  
		
		<!-- 이름 -->
		<label for="name" class="control-label blue">이 름&nbsp;:&nbsp;</label>
		<input type="text" id="name" name="name" maxlength="20" class="form-control input-lg blue" placeholder="Enter Name" required="required"><br> 
		
		<!-- 주소 -->
		<label for="addr" class="control-label blue">주 소&nbsp;:&nbsp;</label>
		<input type="text" id="addr" name="addr" maxlength="20" class="form-control input-lg blue" placeholder="Enter Addr" required="required"><br> 
		
		<!-- 전화번호 -->
		<label for="tel" class="control-label blue">전화번호&nbsp;:&nbsp;</label>
		<input type="tel" id="tel" name="tel" class="form-control input-lg blue" placeholder="Enter CellPhone Number" maxlength="20"><br>
		
		<!-- 운영시간 -->
		<label for="storeHours" class="control-label blue">운영시간&nbsp;:&nbsp;</label>
		<input type="time" id="storeHours" name="storeHours" class="form-control input-lg blue" placeholder="Enter StoreHours"><br>
		
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
		
		<!-- 경도 -->
		<label for="longi" class="control-label blue">경	도&nbsp;:&nbsp;</label>
		<input type="text" name="longi" id="longi" class="form-control input-lg blue" placeholder="Enter Longitude"><br>
		
		<!-- 위도 -->
		<label for="lat" class="control-label blue">위	도&nbsp;:&nbsp;</label>
		<input type="text" name="lat" id="lat" class="form-control input-lg blue" placeholder="Enter Latitude"><br>
		
		<input type="button" class="btn btn-default pull-right btn-bottom-margin" id="button" value="카페 등록" onclick="checking();">
		<hr>
	</form>
	
	<script type="text/javascript">
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
			checkName();
	
			if (nameCheck) {
				alert("카페 등록 완료!");
				document.getElementById("insertStore").submit();
			} else {
				alert("카페 등록에 실패하였습니다.");
			}
		}
	</script>
