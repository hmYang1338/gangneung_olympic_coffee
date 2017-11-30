/**
 * 상품 평가에 관련된 함수들
 * 비동기 ajax 기반으로 구동됨
 * 
 * @author 정태준
 */

//ProductRating Delete
var productRatingdeleteRequest;
function productRatingdeleteBtn(email,ratNum){
	productRatingdeleteRequest = sendRequest("productRatingDelete.do","ratNum="+ratNum+"&email="+email,productRatingdeleteAjax,"GET");
}

function productRatingdeleteAjax(){
	if(productRatingdeleteRequest.readyState == 4 && productRatingdeleteRequest.status == 200){
		$(document).ready(function(){
			alert(productRatingdeleteRequest.responseText);
		});
	}
}