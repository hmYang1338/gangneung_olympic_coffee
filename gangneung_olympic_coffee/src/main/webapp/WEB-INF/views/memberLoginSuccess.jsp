<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

${memberSession.name}님 환영합니다.<br>
Email : ${memberSession.email}

	<form action="deleteMember.do" method="POST">
		<input type="hidden" name="email" value="${memberSession.email}">
		<input type="password" name="password">
		<input type="submit" value="회원 탈퇴">
	</form>
	<br><hr><br><br>
	<form action="updateMember.do" method="POST">
		<input type="hidden" name="email" value="${memberSession.email}"><br>
		<input type="password" name="passwordBefore" value="${memberSession.password}"><br>
		<input type="password" name="password" placeholder="변경할 비밀번호를 입력해주세요."><br>
		<select name="nationCode" id="nationCode">
	  	  	<option value="1">1</option>
		  <c:if test="${not empty requestScope.nationList}">
			<c:forEach items="${requestScope.nationList}" var="nation" >
			  <option value="${nation.nationCode}">${nation.nation}</option>
			</c:forEach>
		  </c:if>
		</select>
	<br>
			<!-- 언어를 설정 -->
		<!-- 	<select required="required"> -->
		<!-- 	  	<option>1</option>지울내용 -->
		<%-- 	  <c:if test="${not empty requestScope.languageList}"> --%>
		<%-- 		<c:forEach var="language" items="${requestScope.languageList}"> --%>
		<%-- 		  <option value="${language.lanCode}">${language.language}</option> --%>
		<%-- 		</c:forEach> --%>
		<%-- 	  </c:if> --%>
		<!-- 이름 -->
		<input type="text" id="name" name="name" maxlength="20" value="${memberSession.name}" required="required"><br>
		<input type="tel" id="tel" name="tel" maxlength="20" value="${memberSession.tel}">
		<input type="radio" id="gender" name="gender" value="1">남&nbsp;&nbsp;&nbsp;
		<input type="radio" id="gender" name="gender" value="2">여<br>
		<input type="date" id="birth" name="birth" value="${memberSession.birth}" required="required"><br>
		<input type="text" id="imgDir" name="imgDir" value="${memberSession.imgDir}"><br>
		<input type="submit" value="변경">
	</form>
</body>
</html>