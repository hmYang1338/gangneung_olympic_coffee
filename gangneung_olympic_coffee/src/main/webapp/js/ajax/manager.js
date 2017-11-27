/**
 * 관리자 페이지
 * @author 양현모
 */

/**
 * 관리자 통합관리 창
 */
var manage;
function manageBtn(){
	manage = sendRequest("showManage.do", null, manageAjax, "GET");
}
//받아온 ajax 객체를 DIV로 출력
function manageAjax() {
	if (manage.readyState == 4 && manage.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(manage.responseText);
		});	
	}
}

/**
 * 운영자 통합관리 창
 */
var managerManage;
function managerManageBtn() {
	managerManage = sendRequest("showManagerManage.do", null, managerManageAjax, "GET");
}
function managerManageAjax() {
	if (managerManage.readyState == 4 && managerManage.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(managerManage.responseText);
		});	
	}
}

/**
 * 카페 통합관리 창
 */
var storeManage;
function storeManageBtn() {
	storeManage = sendRequest("showStoreManage.do", null, storeManageAjax, "GET");
}
function storeManageAjax() {
	if (storeManage.readyState == 4 && storeManage.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(storeManage.responseText);
		});	
	}
}

/* 운영자 계정 입력 */
var managerInsertRequest;
function managerInsertBtn() {
	managerInsertRequest = sendRequest("insertForm.do", null, managerInsert, "GET");
}
function managerInsert() {
	if (managerInsertRequest.readyState == 4 && managerInsertRequest.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(managerInsertRequest.responseText);
		});
	}
}

/* 운영자 계정 조회 */
var managerListRequest;
function managerListBtn() {
	managerListRequest = sendRequest("listAjax.do", null, managerList, "GET");
}
function managerList() {
	if (managerListRequest.readyState == 4 && managerListRequest.status == 200) {
		var resData = managerListRequest.responseText;
		document.getElementById("selectform").innerHTML = resData;
	}
}

var managerDetailRequest;
function managerDetailA() {
	managerDetailRequest = sendRequest("detail.do/${data.email}.do", null, managerDetail, "POST");
}
function managerDetail() {
	if(managerDetailRequest.readyState == 4 && managerDetailRequest.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(managerDetailRequest.responseText);
		});
	}
}

/* 카페 정보 조회 */
var storeListRequest;
function selectStoreBtn() {
	storeListRequest = sendRequest("selectAllStore.do", null, storeList, "GET");
}
function storeList() {
	if (storeListRequest.readyState == 4 && storeListRequest.status == 200) {
		var resData = storeListRequest.responseText;
		document.getElementById("storeListView").innerHTML = resData;
	}
}

/* 카페 정보 입력 */
var storeInsertRequest;
function insertStoreBtn() {
	storeInsertRequest = sendRequest("insertStoreForm.do", null, storeInsert, "GET");
}
function storeInsert() {
	if (storeInsertRequest.readyState == 4 && storeInsertRequest.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(storeInsertRequest.responseText);
		});
	}
}

/**
* 회원List 조회 및 삭제
*/
var memberAllListRequest;
function memberAllListBtn(){
	memberAllListRequest = sendRequest("selectMemberAll.do",null,memberListAjax,"GET");
}
function memberListAjax(){
	if(memberAllListRequest.readyState == 4 && memberAllListRequest.status == 200){
		$(document).ready(function(){
			$("#manager-modal").modal();
			$("#modal-manager").html(memberAllListRequest.responseText);
		});
	}
}