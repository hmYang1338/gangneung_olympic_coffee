/**
 * 스토어 리스트를 비동기 방식으로 출력 함.
 * 비동기 방식으로 div 태그를 추가함.
 * @author 신승엽
 */

//var storeListRequest = sendRequest("storeListMap.do", null, storeAjax, "POST");

function storeAjax() {
	if (storeListRequest.readyState == 4 && storeListRequest.status == 200) {
		var json = storeListRequest.responseText;
		var column =['NAME','ADDR','STOREHOURS','PRODUCTRATING','STORERATING'];
		//json 객체로 받아온 컬럼명을 작성, 추후 객체를 가지고 올 때 사용
		var columnId =['name','addr','storeHour','productRating','storeRating'];
		//tag의 id 값을 지정하기 위하여 사용, css 적용을 위하여 설정 함
		storeListView(json,column,columnId,"storeListView","innerDiv","innerTableDiv");
	}
}
