/**
 * 스토어 리스트를 비동기 방식으로 출력 함.
 * 비동기 방식으로 div 태그를 추가함.
 * @author 신승엽
 */

//메인 화면 실행시 비동기 통신으로 커피숍 목록을 출력함
var storeListRequest = sendRequest("storeListMap.do", "lanCode=1", storeListAjax, "POST");
var storeSelectByIdRequest;
var productRatingListRequest;
var storeRatingListRequest;

//받아온 ajax 객체를 DIV로 출력
function storeListAjax() {
	if (storeListRequest.readyState == 4 && storeListRequest.status == 200) {
		var data ={
				'json': storeListRequest.responseText,//json 객체
				'column' : ['NAME','ADDR','STOREHOURS'], //JSON객체의 열 이름
				'columnId' : ['name','addr','storeHour'], //열 id
				'columnClass' : ['divTableCell','divTableCell','divTableCell'], //열 class
				'elementId' : 'storeListView', //넣으려는 div의 id 값
				'innerSet' : {
						hiddenColumn:['ID','PRODUCTRATING','STORERATING'],
						divId:'innerDiv',
						divClass:'divTableBody',
						tableId:'innerTableDiv',
						tableClass:'divTableRow',
				},
				'innerFunction' : storeSelectById,
		};
		listView(data);
	}
}

//열 별로 클릭 이벤트를 주는 메소드 -> Data의 innerFunction에 넣음
function storeSelectById(element){
	//rating 별 출력
	var elementId = element.firstChild.getAttribute("value");
	
	element.appendChild(starRatingView("PRODUCTRATING",element,elementId));
	element.appendChild(starRatingView("STORERATING",element,elementId));
	
	element.addEventListener("click", function() {
		$(document).ready(function(){
			//fadeToggle->이전에 있던 DIV를 지워지는 듯한 효과를 줌
			$('#storeView').fadeToggle();
			//fadeIn->비워진 DIV에 새로운 항목이 나타나는 듯한 효과를 줌
			$('#storeView').fadeIn();
			//클릭시 해당 매장에 대한 상세 정보가 출력되는 비동기 통신을 시작
			storeSelectByIdRequest = sendRequest("storeSelectById.do", "lanCode="+lanCode+"&id="+elementId, storeAjax, "POST");
			storeRatingListRequest = sendRequest("storeRatingSelectById.do", "lanCode="+lanCode+"&id="+elementId, storeRatingListAjax, "POST");
			productRatingListRequest = sendRequest("productRatingSelectById.do", "lanCode="+lanCode+"&id="+elementId, productRatingListAjax, "POST");
		});
	});
}

//별 표시를 위한 span 테그 생성 및 리턴
function starRatingView(elementName,element,index){
	var divTag = document.createElement("div");
	divTag.id = elementName+index;
	var i;
	for(i=1 ; i<=5; i++){
		var star = document.createElement('span');
		star.className="divTableCell fa fa-star-o "+elementName+index;
		star.setAttribute("data-rating", i);
		divTag.appendChild(star);
	}
	starRating(elementName, element, index, false);
	return divTag;
}

//해당 매장에 대한 상세 정보를 출력 함 -> (storeRating,productRating) 호출 예정
function storeAjax(){
	if (storeSelectByIdRequest.readyState == 4 && storeSelectByIdRequest.status == 200) {
		var data = {
				'json' : storeSelectByIdRequest.responseText,
				'column' : ['name','tel','addr','storeHours'],
				'columnId' :['name','tel','addr','storeHours'],
				'columnClass' : ['store-name','',''],
				'elementId' : 'storeView',
				'innerSet' : {
						hiddenColumn:['id','let','longi'],
						divId:'sinnerDiv',
						divClass:'container bg-gray',
						tableId:'sinnerTableDiv',
						tableClass:'sdivTableRow'
				},
				'executeFunction' : storeBackGroundSettingAndRating
		};
		listView(data);
	}
}

//DB에서 가지고 온 해당 스토어에 해당하는 Background를 출력함
//일단은 문자열로 설정한 뒤 추후 변경 예정
function storeBackGroundSettingAndRating(element){
	element.className="text-vertical-center bgBlur";
	element.style.backgroundImage="url(img/portfolio-2.jpg)";
	
	//요소의 상하 위치를 변경. product 리뷰를 하단으로 옮기기를 위함.
	element.insertBefore(element.lastChild,element.firstChild)
}

function productRatingListAjax(){
	if (productRatingListRequest.readyState == 4 && productRatingListRequest.status == 200) {
		var data = {
				'json' : productRatingListRequest.responseText,
				'column' : ['email','id','code','oz','taste','ratComment','ratDate'],
				'columnId' :['email','id','code','oz','taste','ratComment','ratDate'],
				'columnClass' : ['divTableCell','divTableCell','divTableCell','divTableCell','divTableCell','divTableCell','divTableCell'],
				'elementId' : 'storeView',
				'innerSet' : {
						hiddenColumn:['lanCode','ratNum'],
						divId:'productRatingListView',
						divClass:'container bg-gray',
						tableId:'sinnerTableDiv',
						tableClass:'sdivTableRow'
				}
		};
		listView(data);
	}
}

function storeRatingListAjax(){
	if (storeRatingListRequest.readyState == 4 && storeRatingListRequest.status == 200) {
		var data = {
				'json' : storeRatingListRequest.responseText,
				'column' : ['email','id','interior','ratAccess','costEffect','ratComment','ratDate'],
				'columnId' :['email','id','interior','ratAccess','costEffect','ratComment','ratDate'],
				'columnClass' : ['divTableCell','divTableCell','divTableCell','divTableCell','divTableCell','divTableCell','divTableCell'],
				'elementId' : 'storeView',
				'innerSet' : {
						hiddenColumn:['lanCode','ratNum'],
						divId:'storeRatingListView',
						divClass:'container bg-gray',
						tableId:'sinnerTableDiv',
						tableClass:'sdivTableRow'
				}
		};
		listView(data);
	}
}