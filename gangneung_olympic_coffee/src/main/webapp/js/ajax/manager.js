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
/* 전체 신고조회 */
var reportingListRequest;
function reportListBtn() {
	reportingListRequest = sendRequest("selectReporting.do", null, reportList, "GET");
}
function reportList() {
	if (reportingListRequest.readyState == 4 && reportingListRequest.status == 200) {
		var resData = reportingListRequest.responseText;
		document.getElementById("reportingListView").innerHTML = resData;
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

var updatePwRequest;
function updatePwBtn() {
	updatePwRequest = sendRequest("updatePasswordForm.do", null, updatePw, "GET");
}
function updatePw() {
	if (updatePwRequest.readyState == 4 && updatePwRequest.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(updatePwRequest.responseText);
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
	myStoreRequest = sendRequest("selectMyStore.do", null, myStoreList, "GET");
}
function myStoreList() {
	if (myStoreRequest.readyState == 4 && myStoreRequest.status == 200) {
		var resData = myStoreRequest.responseText;
		document.getElementById("myStore").innerHTML = resData;
	}
}

/* 내 신고 조회 */
var myReportRequest;
function myReportBtn() {
	myReportRequest = sendRequest("selectMyReport.do", null, myReportList, "GET");
}
function myReportList() {
	if(myReportRequest.readyState == 4 && myReportRequest.status == 200) {
		$(document).ready(function() {
			$("#manager-modal").modal();
			$("#modal-manager").html(myReportRequest.responseText);
		});
	}
}

/* main에서 x버튼(운영자 - 상품신고) */
var managerProductReportingRequest;
function managerProductReportingBtn(email, pratNum) {
	managerProductReportingRequest = sendRequest(".do", null, managerProductReporting, "GET");
}
function managerProductReporting() {
	if(managerProductReportingRequest.readyState == 4 && managerProductReportingRequest.status == 200) {
		$(document).ready(function() {
			if(managerProductReportingRequest.responseText==true){
				alert('신고가 정상적으로 완료되었습니다.')
			} else{
				alert('신고가 정상적으로 처리되지 않았습니다.')
			}
		});
	}
}

/* main에서 x버튼(운영자 - 카페신고) */
var managerStoreReportingRequest;
function managerStoreReportingBtn(email, sratNum) {
	managerStoreReportingRequest = sendRequest(".do", null, managerStoreReporting, "GET");
}
function managerStoreReporting() {
	if(managerStoreReportingRequest.readyState == 4 && managerStoreReportingRequest.status == 200) {
		$(document).ready(function() {
			if(managerStoreReportingRequest.responseText==true){
				alert('신고가 정상적으로 완료되었습니다.')
			} else{
				alert('신고가 정상적으로 처리되지 않았습니다.')
			}
		});
	}
}

/* main에서 x버튼(관리자 - 신고된 제품평가 삭제) */
var adminProductReportingRequest;
function adminProductReportingBtn(email, pratNum) {
	adminProductReportingRequest = sendRequest(".do", null, adminProductReporting, "GET");
}
function adminProductReporting() {
	if(adminProductReportingRequest.readyState == 4 && adminProductReportingRequest.status == 200) {
		$(document).ready(function() {
			if(adminProductReportingRequest.responseText==true){
				alert('삭제가 정상적으로 완료되었습니다.')
			} else{
				alert('삭제가 정상적으로 처리되지 않았습니다.')
			}
		});
	}
}

/* main에서 x버튼(관리자 - 신고된 카페평가 삭제) */
var adminStoreReportingRequest;
function adminStoreReportingBtn(email, sratNum) {
	adminStoreReportingRequest = sendRequest(".do", null, adminStoreReporting, "GET");
}
function adminStoreReporting() {
	if(adminStoreReportingRequest.readyState == 4 && adminStoreReportingRequest.status == 200) {
		$(document).ready(function() {
			if(adminStoreReportingRequest.responseText==true){
				alert('삭제가 정상적으로 완료되었습니다.')
			} else{
				alert('삭제가 정상적으로 처리되지 않았습니다.')
			}
		});
	}
}

