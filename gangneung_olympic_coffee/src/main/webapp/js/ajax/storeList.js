/**
 * 스토어 리스트를 비동기 방식으로 출력 함.
 * 비동기 방식으로 div 태그를 추가함.
 * @author 신승엽
 */

var storeListRequest = sendRequest("storeList.do", null, storeListDiv, "GET");

function storeListDiv() {
	if (storeListRequest.readyState == 4 && storeListRequest.status == 200) {
		var json = storeListRequest.responseText;
		json = JSON.parse(json);
		var i = 0;
		for(i;i<json.length;i++){
			var innerStoreDiv = document.createElement("div");
			var storeName = document.createTextNode(json[i].name);
			var storeAddr = document.createTextNode(json[i].addr);
			innerStoreDiv.appendChild(storeName);
			innerStoreDiv.appendChild(storeAddr);
			document.getElementById("storeListView").appendChild(innerStoreDiv);
		}
	}
}
