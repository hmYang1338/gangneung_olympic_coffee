<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="productId" name="productId">

<input type="button" onclick="productRatingByIdBtn()" value="특정 아이디 확인">
<input type="button" onclick="productRatingBtn()" value="전체 확인">

<div id="productRatingTable"></div>

<script src="js/ajax/httpRequest.js"></script>
<script src="js/form/listView.js"></script>
<script src="js/ajax/productRating.js"></script>
</body>
</html>