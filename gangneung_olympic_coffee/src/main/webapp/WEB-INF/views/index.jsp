<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title><spring:message code="site.title" /></title>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<link href="css/stylish-portfolio.css" rel="stylesheet">
<link href="css/style-effect.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="index/navigation.jsp"></jsp:include>
	<jsp:include page="index/header.jsp"></jsp:include>
	<jsp:include page="index/loginModal.jsp"></jsp:include>
	<jsp:include page="index/managerModal.jsp"></jsp:include>
	<jsp:include page="index/store.jsp"></jsp:include>
	<jsp:include page="index/footer.jsp"></jsp:include>


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
	<script src="js/ajax/manager.js"></script>
	<script src="js/ajax/managerList.js"></script>
	<script src="js/form/starRating.js"></script>
	<script src="js/ajax/member.js"></script>
	<script src="js/function/childNode.js"></script>
	<script src="js/function/timeStamp.js"></script>
</body>
</html>
