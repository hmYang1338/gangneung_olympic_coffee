/**
 * 가게 평가에 관련된 함수들
 * 비동기 ajax 기반으로 구동됨
 * 
 * @author 정태준
 */

var storeOneRequest = sendRequest(null,null,storeOneAjax,"POST");
var storeSelectByIdRequest;

function insertStarRating(){
	var element = document.getElementById('insertStoreRatingForm');
	console.log(element);
	var ratings = [ 'interior', 'ratAccess', 'costEffect' ];
	var insertDiv = [ 'interior_view', 'access_view', 'cost_effect_view' ];
	var ratArr = [];
	var i = 0;
	for (i; i < ratings.length; i++) {
		ratArr[i] = elementChildSelectorName(element, ratings[i]);
		document.getElementById(insertDiv[i]).appendChild(starRatingView(ratArr[i], ratings[i],true));
	}
}

function storeOneAjax(){
	if(storeOneRequest.readyState == 4 && storeOneRequest.status == 200){
		var data = {
				'json':storeOneRequest.responseText,//json 객체
				'column' : ['interior','rat_access','cost_effect','rat_comment'],
				'columnId' : ['store-name'],
				'columnClass' : ['divTableCell','divTableCell','divTableCell','divTableCell','divTableCell'],
				'elementId' : 'storeOneInsert',
				'innerSet' : {
					hiddenColumn : ['id','date'],
					divId : '',
					divClass : '',
					tableId : '',
					tableClass : ''
				},
				'innerFunction' : storeRatingAppender
		};
		listView(data);
	}
}

//storeList에 있는 함수 - starRatingView도 있음. 굳이 안씀.
/*function storeRatingAppender(element){
	timeAppandProductStoreRating(element);
	var ratings = ['INTERIOR','RATACCESS','COSTEFFECT'];
	var ratArr = [];
	var i = 0;
	for (i; i < ratings.length; i++){
		ratArr[i] = elementChildSelectorName(element, ratings[i])
		element.appendChild(starRatingView(ratArr[i],ratings[i]));
	}
}*/