/**
 * div 리스트를 만들어 주는 함수
 * 
 * @author 신승엽
 * data[
 * 		json : json 객체
 * 		column : json 객체의 key 값 [배열]
 * 		columnId : Key 값에 매핑되는 id 값 [배열]
 * 		columnClass: key 값에 매핑되는 class 값 [배열]
 * 		columnFunction : 특정 컬럼에 적용될 클릭 이벤트 함수 지정 ['key':function] [배열]
 * 		elementId : 들어갈 div 객체 id
 * 		innerSet : [
 * 			hiddenColumn : 열마다 hidden value 로 저장되는 컬럼 [배열]
 * 			divId : 외부를 감싸는 div 객체의 id
 * 			divClass : 외부를 감싸는 div 객체의 class
 * 			tableId : 하나의 배열을 감싸는 div 객체의 id
 * 			tableClass : 하나의 배열을 감싸는 div 객체의 class
 * 		]
 * 		innerFunction : 열 클릭시 실행되는 DIV등의 함수 지정 ['key':function] [배열]
 * 		executeFunction : 모든 작업이 끝난 후 최종적으로 실행되는 메소드
 * ]
 */

function listView(data){
	//한번에 담아오는 data 배열을 사용하기 쉽게 풀어 줌
	var json = data['json'];
	var column = data['column'];
	var columnId = data['columnId'];
	var columnClass = data['columnClass'];
	var columnFunction = data['columnFunction'];
	var elementId = data['elementId'];
	var innerSet = data['innerSet'];
	var innerFunction = data['innerFunction'];
	var executeFunction = data['executeFunction'];
	
	console.log(elementId,json);
	json = JSON.parse(json);
	
	if(document.getElementById(innerSet['divId'])!=null){
		document.getElementById(innerSet['divId']).remove();
	}
	
	var innerDiv = document.createElement("div");
	var elementDiv = document.getElementById(elementId);
	
	var temp,innerTableDiv,i,j;
	
	//1차 배열인 경우 호환성을 위하여 1행의 2차 배열로 변환
	try{
		json.indexOf(0);
	} catch(exception){
		var jsonTemp = new Array();
		jsonTemp.push(json)
		json = jsonTemp;
	}
	if(json.length==0){
		return;
	}
	
	//각 행별 데이터를 차곡차곡 쌓습니다.
	for(i=0 ;i<json.length;i++){
		innerTableDiv = document.createElement('div');
		innerTableDiv.id = innerSet['tableId']+i;
		innerTableDiv.className = innerSet['tableClass'];
		
		//히든 태그가 NULL이면 동작하지 않으며, 히든 태그 선언시, input type=hidden의 Element 생성
		if(innerSet['hiddenColumn']!=null){
			//히든 태그가 선언된 수 만큼 히든 태그를 제작
			for(j=0 ; j<innerSet['hiddenColumn'].length;j++){
				temp = document.createElement('input');
				temp.setAttribute("type", "hidden");
				temp.setAttribute("name", innerSet['hiddenColumn'][j]);
				temp.setAttribute("id", innerSet['hiddenColumn'][j]);
				temp.setAttribute("value", json[i][innerSet['hiddenColumn'][j]]);
				innerTableDiv.appendChild(temp);	
			}
		}
		
		//각 열별 데이터를 차곡차곡 쌓음
		for(j = 0 ; j<column.length;j++){
			temp = document.createElement('div');
			var text = document.createTextNode(json[i][column[j]]);
			//json 객체의 i번째 인덱스의 컬럼명을 이용하여 값을 가지고 옴 (예, column[1] ->NAME)
			temp.appendChild(text);
			temp.id = columnId[j]+(i+1);
			temp.setAttribute("name", columnId[j]);
			temp.className = columnClass[j];
			if(columnFunction!=null&&columnFunction[[column[j]]]!=null){
				columnFunction[[column[j]]](temp);
			}
			innerTableDiv.appendChild(temp);
		}
		
		//각 열별 추가할 DIV, 클릭 이밴트 등을 넣음
		innerDiv.appendChild(innerTableDiv);
		innerDiv.id = innerSet['divId'];
		innerDiv.className = innerSet['divClass'];
		if(innerFunction!=null){
			innerFunction(innerTableDiv);
		}
	}
	//최종적으로 DIV CHILD로 추가해 줌
	elementDiv.appendChild(innerDiv);
	
	//최종 처리 후 메소드에 처리할 내용이 있는지 확인
	if(executeFunction!=null){
		executeFunction(elementDiv);
	}
}