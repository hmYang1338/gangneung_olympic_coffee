<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><spring:message code="site.title"/></title>
    
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <link href="css/stylish-portfolio.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">

  </head>

<body>

	<!-- 네비게이션 바 -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle">
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
        	<a href="<c:url value="/test.do?lang=ko" />"><spring:message code="site.language.korean"/></a> 
			<a href="<c:url value="/test.do?lang=en" />"><spring:message code="site.language.english"/></a>
			<a href="<c:url value="/test.do?lang=zh" />"><spring:message code="site.language.chinese"/></a>
        </div>
        <!-- 관리자/운영자 모드 -->
        <li>
          <a class="js-scroll-trigger" href="#fff" onclick="">관리자/운영자</a>
        </li>
        <!-- 로그인/회원가입 -->
        <li>
          <a class="js-scroll-trigger" href="#fff" onclick="loginBtn();"><spring:message code="site.list.loginJoin"/></a>
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
					<img src="img/gangneung-coffee-1.jpg" alt="gangneung"
						width="1100" height="500">
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
					<img src="img/gangneung-coffee-2.jpg" alt="gangneung" width="1100"
						height="500">
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
					<img src="img/gangneung-coffee-3.jpg" alt="gangneung" width="1100"
						height="500">
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
					<img src="img/gangneung-coffee-4.jpg" alt="gangneung" width="1100"
						height="500">
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
    
    <!-- 로그인 모달 -->
	<div class="modal fade" id="loginLP" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" id="modalMember">
			</div>
		</div>
	</div>

    <!-- Services -->
    <section id="services" class="services text-center brown-background">
      <h2>You're Best Friend</h2>
      <div class="container">
        <div class="row text-center">
          <div id="storeListView">
          <!-- 여기에 storeList가 나타납니다. -->
          </div>
          <!-- /.col-lg-10 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container -->
    </section>

    <!-- Callout -->
    <aside class="callout">
      <div class="text-vertical-center container" id="storeView">
      <!-- 여기에 store가 나타납니다 -->
      </div>
    </aside>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-10 mx-auto text-center">
            <h4>
              <strong>Start Bootstrap</strong>
            </h4>
            <p>3481 Melrose Place
              <br>Beverly Hills, CA 90210</p>
            <ul class="list-unstyled">
              <li>
                <i class="fa fa-phone fa-fw"></i>
                (123) 456-7890</li>
              <li>
                <i class="fa fa-envelope-o fa-fw"></i>
                <a href="mailto:name@example.com">name@example.com</a>
              </li>
            </ul>
            <br>
            <hr class="small">
            <p class="text-muted">Copyright &copy; <spring:message code="site.footer.teamName"/> 2017</p>
          </div>
        </div>
      </div>
      <a id="to-top" href="#top" class="btn btn-dark btn-lg js-scroll-trigger">
        <i class="fa fa-chevron-up fa-fw fa-1x"></i>
      </a>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/stylish-portfolio.js"></script>
    
    <!-- 사용자 지정 js 추가 -->
	<script src="js/ajax/httpRequest.js"></script>
	<script src="js/form/listView.js"></script>
	<script src="js/ajax/storeList.js"></script>
	<script src="js/ajax/storeSearch.js"></script>
	<script src="js/ajax/memberLoginJoin.js"></script>
	<script src="js/form/starRating.js"></script>
  </body>

</html>
