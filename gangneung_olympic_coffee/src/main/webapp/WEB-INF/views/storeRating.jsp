<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>StoreRating</title>
</head>
<body>
<input type="text" id="storeId" name="storeId">

<input type="button" onclick="storeRatingByIdBtn()" value="특정 아이디 확인">
<input type="button" onclick="storeRatingBtn()" value="전체 확인">

<div id="storeRatingTable"></div>

<script src="js/ajax/httpRequest.js"></script>
<script src="js/ajax/productRating.js"></script>
</body>
</html>