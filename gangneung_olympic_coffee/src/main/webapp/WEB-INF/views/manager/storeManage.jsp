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
				<h3>ī�� ���հ���</h3>
				<hr>
				<input type="button"
					class="btn btn-default brown brown-background radius"
					id="selectStore" name="selectStore" onclick="selectStoreBtn()"
					value="ī������ ��ȸ">
				<input type="button"
					class="btn btn-default brown brown-background radius"
					id="insertStore" name="insertStore" onclick="insertStoreBtn()"
					value="ī������ �Է�"> 
					<!-- <input type="button"
						class="btn btn-default brown brown-background radius" id="updateStore"
						name="updateStore" onclick="updateStoreBtn()" value="ī������ ����">
					<input type="button"
						class="btn btn-default brown brown-background radius" id="deleteStore"
						name="deleteStore" onclick="deleteStoreBtn()" value="ī������ ����"> -->
				<hr>
			</form>
		</div>
	</div>
	
	<div class="text-vertical-center" id="storeView">ī������ ��ȸ / ī������ �Է�</div>
</body>
</html>