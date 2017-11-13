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

function productRatingByIdBtn(){
	var id = document.getElementById('productId').value;
	productRatingByIdRequest = sendRequest("productRatingSelectById.do","lanCode=1&id="+id, productRatingById, "POST");
}

function productRatingById(){
	if (productRatingByIdRequest.readyState == 4 && productRatingByIdRequest.status == 200) {
		var json = productRatingByIdRequest.responseText;
		json = JSON.parse(json);
		console.log(json);
	}
}
function productRatingBtn(){
	productRatingRequest = sendRequest("productRatingSelect.do", "lanCode=1", productRating, "POST");
}
function productRating(){
	if (productRatingRequest.readyState == 4 && productRatingRequest.status == 200) {
		var json = productRatingRequest.responseText;
		json = JSON.parse(json);
		console.log(json);
	}
}


function insertProductRating(){
	
}


function updateProductRating(){
	
}


function deleteProductRating(){
	
}