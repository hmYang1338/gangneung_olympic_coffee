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
	managerInsertRequest = sendRequest("insertForm.do", null, managerInsert, "GET")
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
/*var managerListRequest;
function managerListBtn() {
	managerListRequest = sendRequest("listAjax.do", null, managerList, "GET")
}
function managerList() {
	if (managerListRequest.readyState == 4
			&& managerListRequest.status == 200) {
		var resData = managerListRequest.responseText;
		document.getElementById("selectform").innerHTML = resData;
	}
}*/


/***/
//관리자 화면 실행시 비동기 통신으로 운영자 목록을 출력함
var managerListRequest; //= sendRequest("selectAllManager.do", "lanCode=2", managerListAjax, "POST");
var managerSelectByIdRequest;
var managerSelectByEmailRequest;
function managerListBtn() {
	managerListRequest = sendRequest("selectAllManager.do", "lanCode=2", managerListAjax, "POST");
}
//받아온 ajax 객체를 DIV로 출력
function managerListAjax() {
	if (managerListRequest.readyState == 4 && managerListRequest.status == 200) {
		var data ={
				'json': managerListRequest.responseText,//json 객체
				'column' : ['email','id','name','tel','birth','major'], //JSON객체의 열 이름
				'columnId' : ['email','id','name','tel','birth','major'], //열 id
				'columnClass' : ['divTableCell','divTableCell','divTableCell','divTableCell','divTableCell','divTableCell'], //열 class
				'elementId' : 'managerListView', //넣으려는 div의 id 값
				'innerSet' : {
						divId:'innerDiv',
						divClass:'divTableBody',
						tableId:'innerTableDiv',
						tableClass:'divTableRow',
				},
				'innerFunction' : managerSelectByEmail,
		};
		listView(data);
	}
}

//행 별로 클릭 이벤트를 주는 메소드 -> Data의 innerFunction에 넣음
function managerSelectByEmail(element){
	element.addEventListener("click", function() {
		var elementId = element.firstChild.innerText;
		lanCode=2;
		managerSelectByEmailRequest = sendRequest("managerSelectByEmail.do", "lanCode="+lanCode+"&email="+elementId, managerAjax, "POST");
	});
}


//해당 운영자에 대한 상세 정보를 출력 함
function managerAjax(){
	if (managerSelectByEmailRequest.readyState == 4 && managerSelectByEmailRequest.status == 200) {
		var data = {
				'json' : managerSelectByEmailRequest.responseText,
				'column' : ['email','name','tel','sName','sAddr','sTel'],
				'columnId' :['email','name','tel','sName','sAddr','sTel'],
				'columnClass' : ['store-name',
					'',
					'',
					''],
				'elementId' : 'managerView',
				'innerSet' : {
						divId:'sinnerDiv',
						divClass:'container bg-gray',
						tableId:'sinnerTableDiv',
						tableClass:'sdivTableRow'
				},
				'executeFunction' : managerBackGroundSetting
		};
		listView(data);
	}
}

//DB에서 가지고 온 해당 스토어에 해당하는 Background를 출력함
//일단은 문자열로 설정한 뒤 추후 변경 예정
function managerBackGroundSetting(element){
	element.className="text-vertical-center bgBlur";
	/*element.style.backgroundImage="url(img/portfolio-2.jpg)";*/
	
	//요소의 상하 위치를 변경. product 리뷰를 하단으로 옮기기를 위함.
	element.insertBefore(element.lastChild,element.firstChild)
}
