<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- 네비게이션 바 -->
<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle" 
<c:if test="${not empty memberSession.email}">
	onclick="favoriteListBtn();"			
</c:if>
> <i
	class="fa fa-bars"></i>
</a>
<nav id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"> 
			<i class="fa fa-times"></i>
		</a>
		<li class="sidebar-brand">
			<a class="js-scroll-trigger main-name" href="#top">
				<spring:message code="site.list.top" />
			</a>
		</li>
		<!-- 다국어 선택 -->
		<div>
			<a href="<c:url value="/index.do?lang=ko" />">
				<img class ="lang-img" alt="<spring:message code="site.language.korean" />" src="img/korea.svg"/>
			</a> 
			<a href="<c:url value="/index.do?lang=en" />">
				<img class ="lang-img" alt="<spring:message code="site.language.english" />" src="img/unitedkingdom.svg"/>
			</a> 
			<a href="<c:url value="/index.do?lang=zh" />">
				<img class ="lang-img" alt="<spring:message code="site.language.chinese" />" src="img/china.svg"/>
			</a>
		</div>
		<!-- 로그인/회원가입 -->
		<li>
			<c:choose>
				<c:when
					test="${empty memberSession.email&&empty managerSession.email&&empty adminSession.email}">
					<a class="js-scroll-trigger" href="#fff" onclick="loginBtn();">
						<spring:message code="site.list.loginJoin" /></a>
				</c:when>
				<c:when test="${not empty memberSession.email}">
					<a class="js-scroll-trigger" href="logout.do"><spring:message
							code="site.list.logout" /></a>
					<a class="js-scroll-trigger" href="#fff" onclick="updateBtn();"><spring:message
							code="site.list.update" /></a>
				</c:when>
				<c:when test="${not empty managerSession.email}">
					<a class="js-scroll-trigger" href="logout.do"><spring:message
							code="site.list.logout" /></a>
					<a class="js-scroll-trigger" href="#fff" onclick="managermBtn();"><spring:message
							code="site.member.siteAdmin" /></a>
				</c:when>
				<c:when test="${not empty adminSession.email}">
					<a class="js-scroll-trigger" href="logout.do"><spring:message
							code="site.list.logout" /></a>
					<a class="js-scroll-trigger" href="#fff" onclick="manageBtn();"><spring:message
							code="site.member.siteAdmin" /></a>
					<a class="js-scroll-trigger" href="#fff"
						onclick="memberAllListBtn()">Member List</a>
				</c:when>
			</c:choose>
		</li>
		<!-- 메인으로 -->
		<li><a class="js-scroll-trigger" href="#top"><spring:message
					code="site.list.toMain" /></a></li>
		<!-- 상점 목록으로 -->
		<li><a class="js-scroll-trigger" href="#storeListView"><spring:message
					code="site.list.storeList" /></a></li>
		<c:if test="${not empty memberSession.email}">
			<li>
			<div class="favorite-list" id="favorite-list">
			</div>
			</li>
		</c:if>
		<!-- 관광지 목록으로 -->
		<li><a class="js-scroll-trigger" href="#touristList" onclick="tourList();"><spring:message
					code="site.list.touristList" /></a></li>
		<!-- 물품 검색하기 -->
		<li><div class="productSearch">
			<input type="text" class="text" id="productSearch" placeholder="<spring:message code="site.list.productSearch" />"/>
			<button class="button" onclick="productSearchBtn()"><i class="fa fa-search"></i></button>
		</div></li>

	</ul>
</nav>




