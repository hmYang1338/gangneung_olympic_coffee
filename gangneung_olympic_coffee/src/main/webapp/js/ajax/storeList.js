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
/**
 * json : json 객체
 * column : json 객체의 key 값 [배열]
 * columnId : Key 값에 매핑되는 id 값 [배열]
 * elementId : 들어갈 div 객체 id
 * divId : 외부를 감싸는 div 객체의 id
 * tableId : 하나의 배열을 감싸는 div 객체의 id
 */
function storeListView(json,column,columnId,elementId,divId,tableId){
	console.log(elementId,json);
	json = JSON.parse(json);
	if(document.getElementById(divId)!=null){
		document.getElementById(divId).remove();
	}
	var innerStoreDiv = document.createElement("div");
	var elementDiv = document.getElementById(elementId);
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
			innerTableDiv.id = tableId;
		}
		innerStoreDiv.appendChild(innerTableDiv);
		innerStoreDiv.id = divId;
	}
	elementDiv.appendChild(innerStoreDiv);
}