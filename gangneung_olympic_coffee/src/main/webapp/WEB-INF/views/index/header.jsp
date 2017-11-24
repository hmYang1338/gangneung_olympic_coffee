<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 <!-- 해더 -->
    <header class="header" id="top">
		<!-- 안목해변/강릉 소개 이미지 폼 -->
		<div id="headerImage" class="carousel slide" data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#headerImage" data-slide-to="0" class="active"></li>
				<li data-target="#headerImage" data-slide-to="1"></li>
				<li data-target="#headerImage" data-slide-to="2"></li>
				<li data-target="#headerImage" data-slide-to="3"></li>
			</ul>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/gangneung-coffee-1.jpg" alt="gangneung">
					<div class="carousel-caption main-title">
						<h3>
							<spring:message code="site.main.imgTitle1" />
						</h3>
						<p>
							<spring:message code="site.main.imgSubTitle1" />
						</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="img/gangneung-coffee-2.jpg" alt="gangneung">
					<div class="carousel-caption main-title">
						<h3>
							<spring:message code="site.main.imgTitle2" />
						</h3>
						<p>
							<spring:message code="site.main.imgSubTitle2" />
						</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="img/gangneung-coffee-3.jpg" alt="gangneung">
					<div class="carousel-caption main-title">
						<h3>
							<spring:message code="site.main.imgTitle3" />
						</h3>
						<p>
							<spring:message code="site.main.imgSubTitle3" />
						</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="img/gangneung-coffee-4.jpg" alt="gangneung">
					<div class="carousel-caption main-title">
						<h3>
							<spring:message code="site.main.imgTitle4" />
						</h3>
						<p>
							<spring:message code="site.main.imgSubTitle4" />
						</p>
					</div>
				</div>
				<!-- 이전 앞으로 이동 버튼 -->
				<a class="carousel-control-prev" href="#headerImage" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#headerImage" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
	</header>