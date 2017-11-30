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


var storeRatingRequest;
function storeRatingInsertBtn(id){
	storeRatingRequest = sendRequest("storeRatingBtn.do","id="+id,storeRatingInsertAjax,"POST");
}

function storeRatingInsertAjax(){
	if(storeRatingRequest.readyState == 4 && storeRatingRequest.status == 200){
		$(document).ready(function(){
			$("#store-modal").modal();
			$("#store-modal-view").html(storeRatingRequest.responseText);
			insertStarStoreRating();
		});
	}
}


var productRatingInsertRequest;
function productRatingBtn(id,code,oz){
	productRatingInsertRequest = sendRequest("productRatingBtn.do","id="+id+"&code="+code+"&oz="+oz,productRatingInsertAjax,"POST");
}

function productRatingInsertAjax(){
	if(productRatingInsertRequest.readyState == 4 && productRatingInsertRequest.status == 200){
		$(document).ready(function(){
			$("#store-modal").modal();
			$("#store-modal-view").html(productRatingInsertRequest.responseText);
			insertStarProductRating();
		});
	}
}

//Product Favorite
var productFavoriteInsertRequest;
function productFavoriteInsertBtn(id,code,oz){
	productFavoriteInsertRequest = sendRequest("insertProductFavorite.do","id="+id+"&code="+code+"&oz="+oz,productFavoriteInsertAjax,"POST");
}
function productFavoriteInsertAjax(){
	if(productFavoriteInsertRequest.readyState == 4 && productFavoriteInsertRequest.status == 200){
		$(document).ready(function(){
			alert(productFavoriteInsertRequest.responseText);
		});
	}
}

//Store Favorite
var storeFavoriteInsertRequest;
function storeFavoriteInsertBtn(id){
	storeFavoriteInsertRequest = sendRequest("insertStoreFavorite.do","id="+id,storeFavoriteInserAjax,"POST");
}
function storeFavoriteInserAjax(){
	if(storeFavoriteInsertRequest.readyState == 4 && storeFavoriteInsertRequest.status ==200){
		$(document).ready(function(){
			alert(storeFavoriteInsertRequest.responseText);
		});
	}
}