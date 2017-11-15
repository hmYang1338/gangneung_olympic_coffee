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
				<h1>������ ������</h1>
				<hr>
				<h3>��� ���հ���</h3>
				<hr>
				<input type="button"
					class="btn btn-default brown brown-background radius" id="select"
					name="select" onclick="managerListBtn()" value="��� ��ȸ"> <input
					type="button" class="btn btn-default brown brown-background radius"
					id="insert" name="insert" onclick="managerInsertBtn()"
					value="��� ���">
				<hr>
			</form>
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
	<hr>
	<div id="selectform" align="center"></div>
	<div id="insertform" align="center"></div>

	<div class="container col-centered text-center">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 blue-background">
			<form class="form-group blue">
				<h1>��� ������</h1>
				<hr>
				<h3>��� ������ ��й�ȣ ����</h3>
				<hr>
				<input type="button"
					class="btn btn-default blue blue-background radius"
					id="updatePassword" name="updatePassword"
					onclick="updatePasswordBtn()" value="�н����� ����"><br>
				<hr>
				<h3>�� ī�� ����</h3>
				<hr>
				<input type="button"
					class="btn btn-default blue blue-background radius"
					id="updateMyStore" name="updateMyStore"
					onclick="updateMyStoreBtn()" value="�� ī������ ����">
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

		/* ��� ���� ��ȸ */
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

		/* ��� ���� �Է� */
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

		/* ��� �н����� ���� */
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
		
		/* ������_ī������ ��ȸ */
		function selectStoreBtn() {
			document.requestForm.action = "selectAllStore.do";
			document.requestForm.submit();
		}
		
		/* ������_ī������ �Է� */
		function insertStoreBtn() {
			document.requestForm.action = "insertStoreForm.do";
			document.requestForm.submit();
		}

		/* ������_ī������ ���� */
		function updateStoreBtn() {
			/* document.requestForm.action ="updateStoreForm.do";
			document.requestForm.submit(); */
			location.href = "storeUpdate.jsp"
		}

		/* ������_ī������ ���� */
		function deleteStoreBtn() {
			document.requestForm.action = "updateStoreForm.do";
			document.requestForm.submit();
		}

		/* ���_�� ī������ ���� */
		function updateMyStoreBtn() {
			document.requestForm.action = "updateMyStoreForm.do";
			document.requestForm.submit();
		}
	</script>
</body>
</html>