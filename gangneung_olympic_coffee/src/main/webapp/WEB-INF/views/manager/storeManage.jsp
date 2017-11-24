<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container col-centered text-center">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 brown-background">
			<form class="from-group brown" name="requestForm" method="POST">
				<h3>카페 통합관리</h3>
				<hr>
				<input type="button"
					class="btn btn-default brown brown-background radius"
					id="selectStore" name="selectStore" onclick="selectStoreBtn()"
					value="카페정보 조회">
				<input type="button"
					class="btn btn-default brown brown-background radius"
					id="insertStore" name="insertStore" onclick="insertStoreBtn()"
					value="카페정보 입력"> 
					<!-- <input type="button"
						class="btn btn-default brown brown-background radius" id="updateStore"
						name="updateStore" onclick="updateStoreBtn()" value="카페정보 수정">
					<input type="button"
						class="btn btn-default brown brown-background radius" id="deleteStore"
						name="deleteStore" onclick="deleteStoreBtn()" value="카페정보 삭제"> -->
				<hr>
			</form>
		</div>
	</div>
	
	<div class="text-vertical-center" id="storeView">카페정보 조회 / 카페정보 입력</div>
</body>
</html>