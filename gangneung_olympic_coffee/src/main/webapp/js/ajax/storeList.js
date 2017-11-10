/**
 * 스토어 리스트를 비동기 방식으로 출력 함.
 * @author 신승엽
 */

var storeListRequest = sendRequest("storeList.do", null, StoreListDiv, "GET");

function StoreListDiv() {
	if (storeListRequest.readyState == 4 && storeListRequest.status == 200) {
		var json = storeListRequest.responseText;
		console.log(json);
		var j = 0;
		document.getElementById('storeListView').innerHTML =json;
	}
}