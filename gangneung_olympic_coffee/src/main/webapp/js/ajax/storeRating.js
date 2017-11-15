/**
 * 가게 평가에 관련된 함수들
 * 비동기 ajax 기반으로 구동됨
 * 
 * @author 정태준
 */

var storeRatingByIdRequest;
var storeRatingRequest;
var insertStoreRatingRequest;
var updateStoreRatingRequest;

function storeRatingByIdBtn(){
	var id = document.getElementById('storeId').value;
	storeRatingByIdRequest = sendRequest("storeRatingSelectById.do","lanCode=1&id="+id, storeRatingById, "POST");
}

function storeRatingRequest(){
	if(storeRatingByIdRequest.readyState == 4 && storeRatingByIdRequest.status == 200){
		var json = storeRatingByIdRequest.responseText;
		json = JSON.parse(json);
		console.log(json);
	}
}

function storeRatingBtn(){
	storeRatingRequest = sendRequest("storeRatingSelect.do","lanCode=1", storeRating, "POST");
}

function storeRating(){
	if(storeRatingRequest.readyState == 4 && storeRatingRequest.status == 200){
		var json = storeRatingRequest.responseText;
		json = JSON.parse(json);
		console.log(json);
	}
}

function insertStoreRating(){
	
}

function updateStoreRating(){
	
}

function deleteStoreRating(){
	
}