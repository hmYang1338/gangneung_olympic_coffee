/**
 * 스토어 리스트를 비동기 방식으로 출력 함.
 * 비동기 방식으로 div 태그를 추가함.
 * @author 신승엽
 */

var storeListRequest = sendRequest("storeListMap.do", null, storeListView, "GET");

function storeListView() {
	if (storeListRequest.readyState == 4 && storeListRequest.status == 200) {
		var json = storeListRequest.responseText;
		json = JSON.parse(json);
		var innerStoreDiv = document.createElement("div");
		var column =['NAME','ADDR','STOREHOURS','PRODUCTRATING','STORERATING'];
		//json 객체로 받아온 컬럼명을 작성, 추후 객체를 가지고 올 때 사용
		var columnId =['name','addr','storeHour','productRating','storeRating'];
		//tag의 id 값을 지정하기 위하여 사용, css 적용을 위하여 설정 함
		var temp,innerTableDiv, i=0, j=0;
		for(i;i<json.length;i++){
			innerTableDiv = document.createElement('div');
			for(j =0 ; j<column.length;j++){
				temp = document.createElement('div');
				var text = document.createTextNode(json[i][column[j]]);
				//json 객체의 i번째 인덱스의 컬럼명을 이용하여 값을 가지고 옴 (예, column[1] ->NAME)
				temp.appendChild(text);
				temp.id = columnId[j];
				innerTableDiv.appendChild(temp);
				innerTableDiv.id = 'innerDiv';
			}
			innerStoreDiv.appendChild(innerTableDiv);
			innerStoreDiv.id = 'innerTableDiv';
		}
		document.getElementById("storeListView").appendChild(innerStoreDiv);
	}
}