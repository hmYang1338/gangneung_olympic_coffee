<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#innerDiv div{
		background-color: skyblue;
	}
	#innerTableDiv div{
		border-color: blue;
		border-style: solid;
		border-width: 1px;
	}
	#innerDiv > #name{
		background-color: pink;
	}
</style>
</head>
<body>
<div id="storeListView">
</div>

<script src="js/ajax/httpRequest.js"></script>
<script src="js/ajax/storeList.js"></script>
</body>
</html>