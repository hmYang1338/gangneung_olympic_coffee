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
    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">

  </head>

<body>
	<p>
		<a href="<c:url value="/test.do?lang=ko" />">한국어</a> 
		<a href="<c:url value="/test.do?lang=en" />">English</a>
		<a href="<c:url value="/test.do?lang=zh" />">Chinese</a>
	</p>



	<!-- Navigation -->
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
         <li>
          <a class="js-scroll-trigger" href="#fff" onclick="loginBtn();"><spring:message code="site.list.loginJoin"/></a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#top"><spring:message code="site.list.toMain"/></a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#about"><spring:message code="site.list.storeList"/></a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#portfolio">Portfolio</a>
        </li>
        <li>
          <a class="js-scroll-trigger" href="#contact" onclick='$("#menu-close").click();'>Contact</a>
        </li>
      </ul>
    </nav>

    <!-- Header -->
    <header class="header" id="top">
		<div id="myCarousel" class="carousel slide">
			<ol class="carousel-indicators">
				<li class="item1 active"></li>
				<li class="item2"></li>
				<li class="item3"></li>
				<li class="item4"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="img/gangneung-coffee-1.jpg" alt="GangNeung" width="460" height="345">
					<div class="carousel-caption">
						<h3><spring:message code="site.main.imgTitle1"/></h3>
						<p><spring:message code="site.main.imgSubTitle1"/></p>
					</div>
				</div>
				<div class="item">
					<img src="img/gangneung-coffee-2.jpg" alt="GangNeung" width="460" height="345">
					<div class="carousel-caption">
						<h3><spring:message code="site.main.imgTitle2"/></h3>
						<p><spring:message code="site.main.imgSubTitle2"/></p>
					</div>
				</div>

				<div class="item">
					<img src="img/gangneung-coffee-3.jpg" alt="GangNeung" width="460" height="345">
					<div class="carousel-caption">
						<h3><spring:message code="site.main.imgTitle3"/></h3>
						<p><spring:message code="site.main.imgSubTitle3"/></p>
					</div>
				</div>

				<div class="item">
					<img src="img/gangneung-coffee-4.jpg" alt="GangNeung" width="460" height="345">
					<div class="carousel-caption">
						<h3><spring:message code="site.main.imgTitle4"/></h3>
						<p><spring:message code="site.main.imgSubTitle4"/></p>
					</div>
				</div>

			</div>
			<a class="left carousel-control" href="#myCarousel" role="button">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only"><spring:message code="site.main.previous"/></span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only"><spring:message code="site.main.next"/></span>
			</a>
		</div>
	</header>
    
    <!-- 로그인 모달 -->
	<div class="modal fade" id="loginLP" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" id="modalMember">
			</div>
		</div>
	</div>

	<!-- About -->
    <section id="about" class="about">
      <div class="container text-center">
        <h2>Stylish Portfolio is the perfect theme for your next project!</h2>
        <p class="lead">This theme features some wonderful photography courtesy of
          <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.</p>
      </div>
      <!-- /.container -->
    </section>

    <!-- Services -->
    <section id="services" class="services text-center brown-background">
      <h2>You're Best Friend</h2>
      <div class="container">
        <div class="row text-center">
          <div class="col-lg-10 divTable" id="storeListView">
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

	<!-- Portfolio -->
    <section id="portfolio" class="portfolio">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 mx-auto text-center">
            <h2>Our Work</h2>
            <hr class="small">
            <div class="row">
              <div class="col-md-6">
                <div class="portfolio-item">
                  <a href="#">
                    <img class="img-portfolio img-fluid" src="img/portfolio-1.jpg">
                  </a>
                </div>
              </div>
              <div class="col-md-6">
                <div class="portfolio-item">
                  <a href="#">
                    <img class="img-portfolio img-fluid" src="img/portfolio-2.jpg">
                  </a>
                </div>
              </div>
              <div class="col-md-6">
                <div class="portfolio-item">
                  <a href="#">
                    <img class="img-portfolio img-fluid" src="img/portfolio-3.jpg">
                  </a>
                </div>
              </div>
              <div class="col-md-6">
                <div class="portfolio-item">
                  <a href="#">
                    <img class="img-portfolio img-fluid" src="img/portfolio-4.jpg">
                  </a>
                </div>
              </div>
            </div>
            <!-- /.row (nested) -->
            <a href="#" class="btn btn-dark">View More Items</a>
          </div>
          <!-- /.col-lg-10 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container -->
    </section>

    <!-- Call to Action -->
    <aside class="call-to-action bg-primary text-white">
      <div class="container text-center">
        <h3>The buttons below are impossible to resist.</h3>
        <a href="#" class="btn btn-lg btn-light">Click Me!</a>
        <a href="#" class="btn btn-lg btn-dark">Look at Me!</a>
      </div>
    </aside>

    <!-- Map -->
    <section id="contact" class="map">
      <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
      <br/>
      <small>
        <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
      </small>
    </section>

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
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook fa-fw fa-3x"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter fa-fw fa-3x"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-dribbble fa-fw fa-3x"></i>
                </a>
              </li>
            </ul>
            <hr class="small">
            <p class="text-muted">Copyright &copy; Your Website 2017</p>
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
	<script src="js/effect/mainImageSlide.js"></script>
  </body>

</html>
