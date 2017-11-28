<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
		<div class="container sidebar-wrapper">
			<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle navbar-toggler navbar-toggler-right" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
      			<i class="fa fa-bars"></i>
    		</a>	
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto sidebar-nav">
				
					<!-- <li class="nav-item">
						<a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle">
          					<i class="fa fa-times"></i>
        				</a>
					</li> -->
					<li class="sidebar-brand nav-item">
						<a class="nav-link js-scroll-trigger" href="#top"><spring:message code="site.list.top"/></a>
					</li>
					<li class="nav-item">
						<c:choose>
							<c:when test="${empty memberSession.email&&empty managerSession.email&&empty adminSession.email}">
								<a class="nav-link js-scroll-trigger" href="#fff" onclick="loginBtn();"><spring:message code="site.list.loginJoin"/></a>
							</c:when>
							<c:when test="${not empty memberSession.email}">
								<a class="nav-link js-scroll-trigger" href="logout.do"><spring:message code="site.list.logout"/></a>
								<a class="nav-link js-scroll-trigger" href="#fff" onclick="updateBtn();"><spring:message code="site.list.update"/></a>
							</c:when>
							<c:when test="${not empty managerSession.email}">
								<a class="nav-link js-scroll-trigger" href="logout.do"><spring:message code="site.list.logout"/></a>
								<a class="nav-link js-scroll-trigger" href="#fff" onclick="managermBtn();"><spring:message code="site.member.siteAdmin"/></a>
							</c:when>
							<c:when test="${not empty adminSession.email}">
								<a class="nav-link js-scroll-trigger" href="logout.do"><spring:message code="site.list.logout"/></a>
								<a class="nav-link js-scroll-trigger" href="#fff" onclick="manageBtn();"><spring:message code="site.member.siteAdmin"/></a>
								<a class="nav-link js-scroll-trigger" href="#fff" onclick="memberAllListBtn()">Member List</a>
							</c:when>
						</c:choose>
					</li>
					<!-- 메인으로 -->
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#top"><spring:message code="site.list.toMain"/></a>
					</li>
					
					<!-- 상점 목록으로 -->
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#about"><spring:message code="site.list.storeList"/></a>
					</li>
					<!-- 다국어 선택 -->
					<div style="text-align: center;">
						<a href="<c:url value="/index.do?lang=ko" />"><spring:message code="site.language.korean"/></a> 
						<a href="<c:url value="/index.do?lang=en" />"><spring:message code="site.language.english"/></a>
						<a href="<c:url value="/index.do?lang=zh" />"><spring:message code="site.language.chinese"/></a>
					</div>
				</ul>
			</div>
		</div>
	</nav>





<%-- <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle">
	<i class="fa fa-bars"></i>
</a>
<nav id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle">
			<i class="fa fa-times"></i>
		</a>
		<li class="sidebar-brand">
			<a class="js-scroll-trigger" href="#top"><spring:message code="site.list.top"/></a>
		</li>
		<!-- 다국어 선택 -->
		<div style="text-align: center;">
			<a href="<c:url value="/index.do?lang=ko" />"><spring:message code="site.language.korean"/></a> 
			<a href="<c:url value="/index.do?lang=en" />"><spring:message code="site.language.english"/></a>
			<a href="<c:url value="/index.do?lang=zh" />"><spring:message code="site.language.chinese"/></a>
		</div>
		<!-- 로그인/회원가입 -->
		<li>
			<c:choose>
				<c:when test="${empty memberSession.email&&empty managerSession.email&&empty adminSession.email}">
					<a class="js-scroll-trigger" href="#fff" onclick="loginBtn();"><spring:message code="site.list.loginJoin"/></a>
				</c:when>
				<c:when test="${not empty memberSession.email}">
					<a class="js-scroll-trigger" href="logout.do"><spring:message code="site.list.logout"/></a>
					<a class="js-scroll-trigger" href="#fff" onclick="updateBtn();"><spring:message code="site.list.update"/></a>
				</c:when>
				<c:when test="${not empty managerSession.email}">
					<a class="js-scroll-trigger" href="logout.do"><spring:message code="site.list.logout"/></a>
					<a class="js-scroll-trigger" href="#fff" onclick="managermBtn();"><spring:message code="site.member.siteAdmin"/></a>
				</c:when>
				<c:when test="${not empty adminSession.email}">
					<a class="js-scroll-trigger" href="logout.do"><spring:message code="site.list.logout"/></a>
					<a class="js-scroll-trigger" href="#fff" onclick="manageBtn();"><spring:message code="site.member.siteAdmin"/></a>
					<a class="js-scroll-trigger" href="#fff" onclick="memberAllListBtn()">Member List</a>
				</c:when>
			</c:choose>
		</li>
		<!-- 메인으로 -->
		<li>
			<a class="js-scroll-trigger" href="#top"><spring:message code="site.list.toMain"/></a>
		</li>
		<!-- 상점 목록으로 -->
		<li>
			<a class="js-scroll-trigger" href="#about"><spring:message code="site.list.storeList"/></a>
		</li>	
	</ul>
</nav>
 --%>