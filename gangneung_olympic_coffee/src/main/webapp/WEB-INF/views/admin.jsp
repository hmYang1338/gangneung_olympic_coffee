<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>admin.jsp</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.brown-background {
	background: #f2e6d9;
}

.brown {
	color: #996633;
}

.blue-background {
	background: #f0f0f5;
}

.blue {
	color: #666699;
}
/*  	.green-background{ 
 		background: #daffda; 
	} 
	.green{ 
		color: #009933; 
	} */
.radius {
	border-width: 3px;
	border-color: white;
}

.radius:hover {
	background-color: white;
	color: black;
}
</style>
</head>
<body>
	<div class="container col-centered text-center">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 brown-background">
			<form class="form-group brown">
				<h1>관리자 페이지</h1>
				<hr>
				<h3>운영자 통합관리</h3>
				<hr>
				<input type="button"
					class="btn btn-default brown brown-background radius" id="select"
					name="select" onclick="managerListBtn()" value="운영자 조회"> <input
					type="button" class="btn btn-default brown brown-background radius"
					id="insert" name="insert" onclick="managerInsertBtn()"
					value="운영자 등록">
				<hr>
			</form>
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
	<hr>
	<div id="selectform" align="center"></div>
	<div id="insertform" align="center"></div>

	<div class="container col-centered text-center">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 blue-background">
			<form class="form-group blue">
				<h1>운영자 페이지</h1>
				<hr>
				<h3>운영자 본인의 비밀번호 수정</h3>
				<hr>
				<input type="button"
					class="btn btn-default blue blue-background radius"
					id="updatePassword" name="updatePassword"
					onclick="updatePasswordBtn()" value="패스워드 수정"><br>
				<hr>
				<h3>내 카페 관리</h3>
				<hr>
				<input type="button"
					class="btn btn-default blue blue-background radius"
					id="updateMyStore" name="updateMyStore"
					onclick="updateMyStoreBtn()" value="내 카페정보 수정">
				<hr>
			</form>
		</div>
	</div>
	<hr>
	<div id="updatePasswordform" align="center"></div>

	<script src="js/ajax/httpRequest.js"></script>
	<script type="text/javascript">
		var managerListRequest;
		var managerInsertRequest;
		var updatePasswordRequest;

		/* 운영자 계정 조회 */
		function managerListBtn() {
			managerListRequest = sendRequest("listAjax.do", null, managerList,
					"GET")
		}
		function managerList() {
			if (managerListRequest.readyState == 4
					&& managerListRequest.status == 200) {
				var resData = managerListRequest.responseText;
				document.getElementById("selectform").innerHTML = resData;
			}
		}

		/* 운영자 계정 입력 */
		function managerInsertBtn() {
			managerInsertRequest = sendRequest("insertForm.do", null,
					managerInsert, "GET")
		}
		function managerInsert() {
			if (managerInsertRequest.readyState == 4
					&& managerInsertRequest.status == 200) {
				var resData = managerInsertRequest.responseText;
				document.getElementById("insertform").innerHTML = resData;
			}
		}

		/* 운영자 패스워드 수정 */
		function updatePasswordBtn() {
			updatePasswordRequest = sendRequest("updatePasswordForm.do", null,
					updatePassword, "GET")
		}
		function updatePassword() {
			if (updatePasswordRequest.readyState == 4
					&& updatePasswordRequest.status == 200) {
				var resData = updatePasswordRequest.responseText;
				document.getElementById("updatePasswordform").innerHTML = resData;
			}
		}
		
		/* 관리자_카페정보 조회 */
		function selectStoreBtn() {
			document.requestForm.action = "selectAllStore.do";
			document.requestForm.submit();
		}
		
		/* 관리자_카페정보 입력 */
		function insertStoreBtn() {
			document.requestForm.action = "insertStoreForm.do";
			document.requestForm.submit();
		}

		/* 관리자_카페정보 수정 */
		function updateStoreBtn() {
			/* document.requestForm.action ="updateStoreForm.do";
			document.requestForm.submit(); */
			location.href = "storeUpdate.jsp"
		}

		/* 관리자_카페정보 삭제 */
		function deleteStoreBtn() {
			document.requestForm.action = "updateStoreForm.do";
			document.requestForm.submit();
		}

		/* 운영자_내 카페정보 수정 */
		function updateMyStoreBtn() {
			document.requestForm.action = "updateMyStoreForm.do";
			document.requestForm.submit();
		}
	</script>
</body>
</html>