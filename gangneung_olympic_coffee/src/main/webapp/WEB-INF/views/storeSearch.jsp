<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id ="storeSearch">
		<input type="text" id="name" name="name">
		<input type="button" value="검색" id="search" name="search" onclick="storeSearch()">
	</form>
	<div id="storeSearchResult"></div>
<script src="js/ajax/httpRequest.js"></script>
<script src="js/ajax/storeSearch.js"></script>
<script src="js/ajax/storeList.js"></script>
</body>
</html>