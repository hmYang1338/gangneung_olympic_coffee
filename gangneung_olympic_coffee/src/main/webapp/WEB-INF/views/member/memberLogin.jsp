<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<style type="text/css">
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
	}
	.btn-bottom-margin{
		margin-bottom: 20px;
	}
</style>


	<!-- 로그인 구현 -->
		<form action="loginPage.do" method="POST">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
			<hr class="hr-white">
			<h3 class="blue text-center"><spring:message code="site.member.login"/></h3>
			<hr class="hr-white">
					<label for="email" class="control-label blue"><spring:message code="site.member.email"/>&nbsp;:&nbsp;</label>
					<input type="email" id="email" name="email" maxlength="30" placeholder='<spring:message code="site.member.email"/>' class="form-control input-lg blue" required="required">
				
				<br>
				
				<!-- 비밀번호 -->
					<label for="password" class="control-label blue"><spring:message code="site.member.password"/>&nbsp;:&nbsp;</label>
					<input type="password" id="password" name="password" maxlength="16" placeholder='<spring:message code="site.member.passwordPlaceHolder"/>' class="form-control input-lg blue" required="required"><br>
					<!--  -->

					<input class="btn btn-default pull-left btn-bottom-margin" type="button" value='<spring:message code="site.member.join"/>' onclick="joinBtn()">
					<!-- 로그인 버튼(Submit) -->
					<input class="btn btn-default pull-right btn-bottom-margin" type="submit" value='<spring:message code="site.member.login"/>'>
		</form>

