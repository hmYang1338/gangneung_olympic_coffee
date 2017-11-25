/**
 * @author 정태준
 */

/**
 * Modal을 통한 Join페이지 이동을 위한 함수
 * **/
var memberJoin;
function joinBtn(){
	memberJoin = sendRequest("memberJoinBtn.do", null, memberJoinAjax, "GET");
}

//받아온 ajax 객체를 DIV로 출력
function memberJoinAjax() {
	if (memberJoin.readyState == 4 && memberJoin.status == 200) {
		$(document).ready(function() {
			$("#modalMember").html(memberJoin.responseText);
		});	
	}
}

/**
 * Modal을 통한 Update페이지 이동을 위한 함수
 * **/
var memberUpdate;
function updateBtn(){
	memberUpdate = sendRequest("memberUpdateBtn.do",null,memberUpdateAjax,"GET");
}


function memberUpdateAjax(){
	if(memberUpdate.readyState == 4 && memberUpdate.status == 200) {
		$(document).ready(function(){
			$("#loginLP").modal();
			$("#modalMember").html(memberUpdate.responseText);
		});
	}
}


var storeRatingInsert;
function storeRatingInsertBtn(){
	storeRatingInsert = sendRequest("storeRatingInsertBtn.do",null,storeRatingInsertAjax,"GET");
}

function storeRatingInsertAjax(){
	if(storeRatingInsert.readyState == 4 && storeRatingInsert.status == 200){
		$(document).ready(function(){
			$("#loginLP").modal();
			$("#modalMember").html(storeRatingInsert.responseText);
		});
	}
}