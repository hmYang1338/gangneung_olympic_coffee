/**
 * div 리스트를 만들어 주는 함수
 * 
 * @author 신승엽
 * json : json 객체
 * column : json 객체의 key 값 [배열]
 * columnId : Key 값에 매핑되는 id 값 [배열]
 * elementId : 들어갈 div 객체 id
 * divId : 외부를 감싸는 div 객체의 id
 * tableId : 하나의 배열을 감싸는 div 객체의 id
 */
function listView(json,column,columnId,elementId,divId,tableId){
	console.log(elementId,json);
	json = JSON.parse(json);
	if(document.getElementById(divId)!=null){
		document.getElementById(divId).remove();
	}
	var innerDiv = document.createElement("div");
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
		innerDiv.appendChild(innerTableDiv);
		innerDiv.id = divId;
	}
	elementDiv.appendChild(innerDiv);
}