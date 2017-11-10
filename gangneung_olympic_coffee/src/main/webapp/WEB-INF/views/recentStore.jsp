<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>Home</title>
</head>
<body>
	<h1>Indexed DB를 활용한 북마크 관리</h1>	
	<div class="mainContent">
		<h2>북마크 추가</h2>
		<div>
			북마크 URL: <input type="url" id="id" required>
			<button id="addBookmark">추가</button>
		</div>
		<h2>북마크 목록</h2>
		<div>
			<div>
				<table id="bookmarkList" border="1">
					<thead>
						<tr>
							<th>id</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
<script type="text/javascript" src="js/form/bookmark.js"></script>
</body>
</html>
