/**
 * 음료수 평가에 관련된 함수들
 * 비동기 ajax 기반으로 구동됨
 * 
 * @author 신승엽
 */

var productRatingByIdRequest;
var productRatingRequest;
var insertProductRatingRequest;
var updateProductRatingRequest;

function productRatingById(){
	var id = document.getElementById('productId');
	productRatingByIdRequest = sendRequest("nearByStore.do", "id="+id, gpsStore, "POST");
}


function productRating(){
	
}


function insertProductRating(){
	
}


function updateProductRating(){
	
}


function deleteProductRating(){
	
}