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

/**
 * 신고 관리 창
 */
var reportManage;
function reportManageBtn() {
	reportManage = sendRequest("showReportManage.do", null, reportManageAjax, "GET");
}
function reportManageAjax() {
	if (reportManage.readyState == 4 && reportManage.status == 200){
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(reportManage.responseText);
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

/*************************************운영자 페이지*************************************/
/**
 * 운영자 관리 페이지 모달
 */
var manager;
function managermBtn() {
	manager = sendRequest("showManager.do", null, managermAjax, "GET");
}
function managermAjax() {
	if (manager.readyState == 4 && manager.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(manager.responseText);
		});	
	}
}

/**
 * 내 정보 관리
 */
var myManage;
function myManageBtn() {
	myManage = sendRequest("showMyManage.do", null, myManageAjax, "GET");
}
function myManageAjax() {
	if (myManage.readyState == 4 && myManage.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(myManage.responseText);
		});
	}
}

/**
 * 내 카페 관리
 */
var myStoreManage;
function myStoreManageBtn() {
	myStoreManage = sendRequest("showMyStoreManage.do", null, myStoreManageAjax, "GET");
}
function myStoreManageAjax() {
	if (myStoreManage.readyState == 4 && myStoreManage.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(myStoreManage.responseText);
		});
	}
}

/* 내 카페 정보 조회 */
var myStoreRequest;
function selectMyStoreBtn() {
	myStoreRequest = sendRequest("selectMyStore.do", null, storeList, "GET");
}
function storeList() {
	if (myStoreRequest.readyState == 4 && myStoreRequest.status == 200) {
		var resData = myStoreRequest.responseText;
		document.getElementById("myStore").innerHTML = resData;
	}
}



