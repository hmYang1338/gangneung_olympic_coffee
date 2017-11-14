/**
 * 
 * store 검색에 사용되는 비동기 메소드 입니다.
 * 사용하기 전에 storeList.js 와 httpRequest를 먼저 선언해 주어야 합니다.
 * @author 신승엽
 */

var storeSearchListRequest;
function storeSearch(){
	var name = document.getElementById("name").value;
	if(name.trim()==""){
		alert("검색어를 입력하세요.")
	} else{
		storeSearchListRequest = sendRequest("storeSelectByName.do", "name="+name , storeSearchAjax, "POST");
	}
}

function storeSearchAjax() {
	if (storeSearchListRequest.readyState == 4 && storeSearchListRequest.status == 200) {
		var json = storeSearchListRequest.responseText;
		var column =['NAME','ADDR','STOREHOURS','PRODUCTRATING','STORERATING'];
		var columnId =['name','addr','storeHour','productRating','storeRating'];
		listView(json,column,columnId,"storeSearchResult","innerDiv","innerTableDiv");
	}
}