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
					<select name="nationCode" id="nationCode" class="form-control input-lg blue">
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
					 	<select name="lanCode" id="lanCode" class="form-control input-lg blue">
					 	  <c:if test="${not empty requestScope.languageList}">
					 		<c:forEach var="language" items="${requestScope.languageList}">
					 		  <option value="${language.lanCode}">${language.language}</option>
					 		</c:forEach>
					 	  </c:if>
						</select>
					</div><br>
					
					<!-- 회원 이름 변경 -->
					<div class="form-group">
						<label for="lanCode" class="control-label blue">Update Name&nbsp;:&nbsp;</label>
						<input type="text" id="name" name="name" class="form-control input-lg blue" maxlength="20" value="${memberSession.name}" required="required">
					</div><br>
					
					<!-- 회원 국가 변경 -->
					<div class="form-group">
						<label for="lanCode" class="control-label blue">Update CellPhone&nbsp;:&nbsp;</label>
						<input type="tel" id="tel" name="tel" class="form-control input-lg blue" maxlength="20" value="${memberSession.tel}">
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
				
					
					
					<input type="date" id="birth" class="form-control input-lg blue" name="birth" value="${memberSession.birth}" required="required"><br>
					<input type="text" id="imgDir" class="form-control input-lg blue" name="imgDir" value="${memberSession.imgDir}"><br>
					<input type="submit" class="btn-bottom-margin" value="변경">
			</form>
