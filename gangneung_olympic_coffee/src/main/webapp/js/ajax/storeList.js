/**
 * 스토어 리스트를 비동기 방식으로 출력 함.
 * 비동기 방식으로 div 태그를 추가함.
 * @author 신승엽
 */
var lanCode = 1;
//메인 화면 실행시 비동기 통신으로 커피숍 목록을 출력함
var storeListRequest = sendRequest("storeListMap.do", null, storeListAjax, "POST");
var storeSelectByIdRequest;
var productRatingListRequest;
var storeRatingListRequest;

//받아온 ajax 객체를 DIV로 출력
function storeListAjax() {
	if (storeListRequest.readyState == 4 && storeListRequest.status == 200) {
		var data ={
				'json': storeListRequest.responseText,//json 객체
				'elementId' : 'storeListView', //넣으려는 div의 id 값
				'innerSet' : {
						'hiddenColumn' : ['ID','NAME','PRODUCTRATING','STORERATING','ADDR','STOREHOURS','IMG','LANCODE'],
						'divClass' : '',
						'divId' : '',
						'tableClass' : 'store-list pic col-xs-6 col-ms-4 col-md-4 col-lg-4',
						'tableId' : ''
				},
				'innerFunction' : storeSelectById,
				'executeFunction' : storeListExcute
		};
		listView(data);
	}
}


//행 별로 클릭 이벤트를 주는 메소드 -> Data의 innerFunction에 넣음
function storeSelectById(element) {
	$(document).ready(function() {
		//다국어 코드
		lanCode = parseInt(elementChildSelectorName(element,'LANCODE').value);
		var gangNeung = ['','GangNeung','강릉','江陵'];
		//자식 객체의 값을 받아와 id값을 받아옴
		var elementId = element.firstChild.getAttribute("value");
		//figure 생성
		var figureElement = document.createElement('figure');
		figureElement.className = 'snip1445 cursor';
		//<IMG>
		var cafeImage = document.createElement('img');
		//각 카페별 대표 이미지 값들을 받아옴. 거기에서 가벼운 파일인 preview파일로 바꾸기 위하여 치환 함.
		cafeImage.src = elementChildSelectorName(element,'IMG').value.replace('.JPG', '_preview.JPG');
		cafeImage.className = 'store-list-image';
		//figureCaption 생성
		var figureCaptionElement = document.createElement('figcaption');
		//div 생성
		var headingElement = document.createElement('div');
		headingElement.className = 'heading';
		var headingTextElement = document.createElement('h4');
		headingTextElement.appendChild(document.createTextNode(gangNeung[lanCode]));
		//var captionElement = document.createElement('div');
		//captionElement.className = 'caption';
		var spanElement = document.createElement('span');
		var captionTextElement = document.createElement('h6');
		captionTextElement.appendChild(document.createTextNode(elementChildSelectorName(element,'NAME').value));
		spanElement.appendChild(captionTextElement);
		//div에 상점 이름을 넣음
		headingElement.appendChild(headingTextElement);
		headingElement.appendChild(spanElement);
		figureCaptionElement.appendChild(headingElement);
		//figureCaptionElement.appendChild(captionElement);
		figureElement.appendChild(cafeImage);
		figureElement.appendChild(figureCaptionElement);
		element.appendChild(figureElement);

		element.addEventListener("click", function() {
			$('#storeView').height(0);
			//storeView로 스크롤을 이동함.
			$('html, body').animate({
				scrollTop : $("#storeView").offset().top
			}, 1000);
			$('#storeView').animate({
				height:'+=300px'
			});
			$('#store-content').html('');
//			//fadeToggle->이전에 있던 DIV를 지워지는 듯한 효과를 줌
//			$('#storeView').fadeToggle();
//			//fadeIn->비워진 DIV에 새로운 항목이 나타나는 듯한 효과를 줌
//			$('#storeView').fadeIn();
			//클릭시 해당 매장에 대한 상세 정보가 출력되는 비동기 통신을 시작
			storeSelectByIdRequest = sendRequest("storeSelectById.do", "id=" + elementId, storeAjax, "POST");
			storeRatingListRequest = sendRequest("storeRatingSelectJoinById.do", "id=" + elementId, storeRatingListAjax, "POST");
			productRatingListRequest = sendRequest("productRatingSelectJoinById.do", "id=" + elementId, productRatingListAjax, "POST");
		});
	});
}

function storeListExcute(element){
	//store,product Rating을 저장할 새로운 div 객체 생성
	var storeDiv = document.createElement('div');

	storeDiv.id = 'rating_view';
	storeDiv.className = 'rating_list';
	storeDiv.setAttribute("name", 'rating_view')

	document.getElementById('storeView').appendChild(storeDiv);
	console.log(document.getElementById('storeView').id);
}


//해당 매장에 대한 상세 정보를 출력 함 -> (storeRating,productRating) 호출 예정
function storeAjax(){
	if (storeSelectByIdRequest.readyState == 4 && storeSelectByIdRequest.status == 200) {
		var data = {
				'json' : storeSelectByIdRequest.responseText,
				'column' : ['name','tel','addr','storeHours'],
				'columnId' :['store-name','tel','addr','storeHours'],
				'columnClass' : ['store-name','','',''],
				'elementId' : 'storeView',
				'innerSet' : {
						hiddenColumn:['id','lat','longi','smokingRoom','storeUrl','img','storeSource'],
						divId:'sinnerDiv',
						divClass:'bg-gray',
						tableId:'sinnerTableDiv',
						tableClass:'text-center store-info col-sm-12'
				},
				'innerFunction' : storeExecute,
				'executeFunction' : storeExecutePlus
		};
		listView(data);
	}
}

//DB에서 가지고 온 후 따로 div를 구성할 객체들
function storeExecute(element){
	//제목을 클릭하면 해당 페이지로 이동하는 코드
	var nameElement = elementChildSelectorName(element,'store-name');
	var paddingValue = 35;
	var paddingName = 0;
	//비동기 통신으로 스토어 위치를 구글 맵에 표시
	 	iconMaker(nameElement, 'store_icon', 'img/read-more.svg', function(e){
	 		e.stopPropagation();
	 		$(document).ready(function() {
	 			var storeContent = $('#store-content');
	 			storeContent.html(elementChildSelectorName(element, 'storeSource').value);
	 			//storeView로 스크롤을 이동함.
	 			$('html, body').animate({
	 				scrollTop : storeContent.offset().top
	 			}, 1000);
	 			var closeText = ['','Close','닫기','关闭'];
	 			var close = document.createElement('div');
	 			close.addEventListener('click',function(){
	 				storeContent.html('');
	 				$('html, body').animate({
	 					scrollTop : $('#storeView').offset().top
	 				}, 2000);
	 			});
	 			close.appendChild(document.createTextNode(closeText[lanCode]));
	 			close.className ='cursor bg-gray';
	 			close.id='read-more-btn';
	 			document.getElementById('store-content').appendChild(close);
	 		});
	 	});
	 	paddingName= paddingName+paddingValue;
	//스토어 위치를 구글 맵에 표시
	iconMaker(nameElement, 'store_icon', 'img/gps.svg', function(e){
		$("#map").html('');
		e.stopPropagation();
		$(document).ready(function() {
			$("#map-modal").modal();
		});
		setMap(parseFloat(elementChildSelectorName(element,'lat').value),
				parseFloat(elementChildSelectorName(element,'longi').value));
		setTimeout(function () {
		    google.maps.event.trigger(map, 'resize');
		    setMap(parseFloat(elementChildSelectorName(element,'lat').value),
					parseFloat(elementChildSelectorName(element,'longi').value));
		}, 1000);
	});
	paddingName= paddingName+paddingValue;

	//즐겨찾기
	if(auth.authority==1){
		iconMaker(nameElement, 'store_icon', 'img/bookmark.svg', function(e) {
			e.stopPropagation();
			var id = elementChildSelectorName(element, 'id').value;
			storeFavoriteInsertBtn(id);
			//alert("Table 설계 후 구현 계획 - 가게 정보 즐겨찾기");
		});
		paddingName= paddingName+paddingValue;
	}


		//코맨트 입력
		if(auth.authority==1){
		iconMaker(nameElement, 'store_icon', 'img/chat.svg', function(e){
			e.stopPropagation();
			$(document).ready(function() {
				//$("#store-modal").modal();
				//$(#store-modal-view).html();
				var id = elementChildSelectorName(element, 'id').value;
				/**
				 * 구현을 요함 - 정태준
				 */
				//alert(id);
				var modalView = document.getElementById('store-modal-view');
				modalView.innerHTML='';
				storeRatingInsertBtn(id);
				//store-modal-view
				//innerHTML로 떠서
			});
		});
		paddingName= paddingName+paddingValue;
		}

		//메뉴 리스트
		iconMaker(nameElement, 'store_icon', 'img/restaurant-menu.svg', function(e){
			e.stopPropagation();
			$(document).ready(function() {
				var modalView = document.getElementById('store-modal-view');
				modalView.innerHTML='';
				$("#store-modal").modal();
				menuList(elementChildSelectorName(element, 'id').value);
			});
			
		});
		paddingName= paddingName+paddingValue;
		 nameElement.style.paddingLeft = ""+paddingName+"px";
		//링크
		var siteUrl = elementChildSelectorName(element,'storeUrl');
		 		if(isEmpty(siteUrl.value)){
		 			var siteVisit = ['','Visiting web site', '사이트 방문', '访问网站'];
		 			var site = document.createElement('div');

		 			site.appendChild(document.createTextNode(siteVisit[lanCode]));
		 			site.className ='cursor bg-gray';
		 			site.id='visit-site-btn';
		 			site.addEventListener('click',function(){
		 				location.href = elementChildSelectorName(element,'storeUrl').value;
		  			});
		 			element.appendChild(site);
		 		}
}

function storeExecutePlus(element){
	//정보가 있는 엘리멘트를 받아옴
	var resourceElement = element.lastChild.firstChild;
	document.getElementById('store-background-blur').style.backgroundImage='url("'+elementChildSelectorName(resourceElement,'img').value+'")';
	//요소의 상하 위치를 변경. product 리뷰를 하단으로 옮기기를 위함.
	element.insertBefore(element.lastChild,element.lastChild.previousElementSibling);
}

function productRatingListAjax(){
	if (productRatingListRequest.readyState == 4 && productRatingListRequest.status == 200) {
		var data = {
				'json' : productRatingListRequest.responseText,
				'column' : ['EMAIL','RATCOMMENT'],
				'columnId' :['email','ratComment'],
				'columnClass' : ['rating_email','rating_rat_comment',],
				'elementId' : 'rating_view',
				'innerSet' : {
						hiddenColumn:['ID','CODE','LANCODE','PRODUCT','RATNUM','RATDATE','OZ','TASTE'],
						divId:'productRatingListView',
						divClass:'container bg-gray',
						tableId:'sinnerTableDiv',
						tableClass:'sdivTableRow'
				},
				'innerFunction' : productRatingAppander
		};
		listView(data);
	}
}

function storeRatingListAjax(){
	if (storeRatingListRequest.readyState == 4 && storeRatingListRequest.status == 200) {
		var data = {
				'json' : storeRatingListRequest.responseText,
				'column' : ['EMAIL','RATCOMMENT'],
				'columnId' :['email','ratComment'],
				'columnClass' : ['rating_email','rating_rat_comment'],
				'elementId' : 'rating_view',
				'innerSet' : {
						hiddenColumn:['LANCODE','RATNUM','RATDATE','ID','INTERIOR','RATACCESS','COSTEFFECT'],
						divId:'storeRatingListView',
						divClass:'container bg-gray',
						tableId:'sinnerTableDiv',
						tableClass:'rating_list_column'
				},
				'innerFunction' : storeRatingAppander
		};
		listView(data);
	}
}

function productRatingAppander(element) {
	timeAppandProductStoreRating(element,parseInt(elementChildSelectorName(element,'LANCODE').value));
	//타임 DIV 안에 삭제 DIV를 추가하기
	if(auth.authority!=0){
		console.log(auth.email,elementChildSelectorName(element,'email').firstChild.nodeValue)
		if (auth.email == elementChildSelectorName(element, 'email').firstChild.nodeValue
				|| auth.authority != 1) {
			var timeElement = elementChildSelectorName(element, 'RATDATETIME');
			var ratNum = elementChildSelectorName(element, 'RATNUM').value;
			iconMaker(timeElement, 'cancel-icon', 'img/close.svg', function() {
				if (auth.authority == 1) {
					//alert('일반 사용자!');
					// 여기에 메소드를 추가하세요! (일반 로그인 사용자의 자신의 글 삭제)
					var check = prompt("삭제하고 싶으시다면 y");
					if(check.toLowerCase() == 'y' || check.toLowerCase() == 'yes'){
						productRatingdeleteBtn(auth.email,ratNum);
					}else{
						return false;
					}
				} else if (auth.authority == 2) { //운영자
					managerProductReportingBtn(elementChildSelectorName(element, 'email').firstChild.nodeValue, ratNum);
					alert('관리자/운영자!');
					// 여기에 메소드를 추가하세요! (관리자는 삭제를, 운영자는 신고 기능으로)
				} else if( auth.authority == 3){ //관리자
					adminProductReportingBtn(elementChildSelectorName(element, 'email').firstChild.nodeValue, ratNum);
				}
			});
		}
	}

	var ratingLanguage = ['','TASTE','풍미','风味'];
	var ozLanguage = ['','OZ(size)','크기','盎司']

	//새로운 레이팅 element를 생성
	var ratingElement = document.createElement('div');
	ratingElement.setAttribute('name','productRating_div');
	ratingElement.className='rating_element';

	//음료의 이름을 출력할 element
	var productName = document.createElement('div');
	productName.className='rating_name';
	productName.appendChild(document.createTextNode(elementChildSelectorName(element, 'PRODUCT').value));
	ratingElement.appendChild(productName);

	//음료의 크기를 출력할 element
	var ozName = document.createElement('div');
	ozName.className='rating_name';
	ozName.appendChild(document.createTextNode(ozLanguage[parseInt(elementChildSelectorName(element,'LANCODE').value)]+' : '+elementChildSelectorName(element, 'OZ').value));
	ratingElement.appendChild(ozName);

	//레이팅 바 구현
	var ratingName = document.createElement('div');
	ratingName.className='rating_name';
	ratingName.appendChild(document.createTextNode(ratingLanguage[parseInt(elementChildSelectorName(element,'LANCODE').value)]));
	ratingElement.appendChild(ratingName);
	var ratingStar = starRatingView(elementChildSelectorName(element, 'TASTE'), 'TASTE', false);
	ratingStar.className='rating_star';
	ratingElement.appendChild(ratingStar);

	//요소별 위치를 재정의

	element.insertBefore(elementChildSelectorName(element,'ratComment'),elementChildSelectorName(element,'TASTEDIV'));
	element.insertBefore(ratingElement,elementChildSelectorName(element,'ratComment'));
}


function storeRatingAppander(element) {
	//시간을 추가하는 메소드 추가
	timeAppandProductStoreRating(element,parseInt(elementChildSelectorName(element,'LANCODE').value));
	//타임 DIV 안에 삭제 DIV를 추가하기
	if(auth.authority!=0){
		console.log(auth.email,elementChildSelectorName(element,'email').firstChild.nodeValue)
		if (auth.email == elementChildSelectorName(element, 'email').firstChild.nodeValue
				|| auth.authority != 1) {
			var timeElement = elementChildSelectorName(element, 'RATDATETIME');
			var ratNum = elementChildSelectorName(element, 'RATNUM').value;
			iconMaker(timeElement, 'cancel-icon', 'img/close.svg', function() {
				if (auth.authority == 1) {
					//alert('일반 사용자!');
					// 여기에 메소드를 추가하세요! (일반 로그인 사용자의 자신의 글 삭제)
					storeRatingdeleteBtn(auth.email,ratNum);
				} else if (auth.authority == 2) {
					alert('관리자/운영자!');
					managerStoreReportingBtn(elementChildSelectorName(element, 'email').firstChild.nodeValue, ratNum);
					// 여기에 메소드를 추가하세요! (관리자는 삭제를, 운영자는 신고 기능으로)
				} else if (auth.authority == 3) {
					adminStoreReportingBtn(elementChildSelectorName(element, 'email').firstChild.nodeValue, ratNum);
				}
			});
		}
	}
	
	//스토어 레이팅(별)을 추가하는 메소드
	var ratings = [ 'INTERIOR', 'RATACCESS', 'COSTEFFECT' ];
	var ratingLanguage = [0,['Interior', 'Accessibility', 'Cost-Effectiveness'],
		['인테리어','접근성','가성비'],
		['室内','亲和力','性价比']];
	//스토어 레이팅을 언어마다 각기 다른 번역을
	var ratArr = [];
	var i = 0;
	//스토어 레이팅을 만들 DIV 객체를 생성
	var ratingElement = document.createElement('div');
	ratingElement.setAttribute('name','storeRating_div');
	ratingElement.className='rating_element';
	//스토어 레이팅 객체를 생성
	for (i; i < ratings.length; i++) {
		//각 레이팅 이름을 더함
		ratArr[i] = elementChildSelectorName(element, ratings[i])
		var ratingName = document.createElement('div');
		ratingName.className='rating_name';
		ratingName.appendChild(document.createTextNode(ratingLanguage[parseInt(elementChildSelectorName(element,'LANCODE').value)][i]));
		//실제 레이팅 스타를 더함
		ratingElement.appendChild(ratingName);
		var ratingStar = starRatingView(ratArr[i], ratings[i], false);
		ratingStar.className='rating_star';
		ratingElement.appendChild(ratingStar);
	}
	//요소별 위치를 재정의
	element.insertBefore(elementChildSelectorName(element,'ratComment'),elementChildSelectorName(element,'INTERIORDIV'));
	element.insertBefore(ratingElement,elementChildSelectorName(element,'ratComment'));
}

//Date타입을 사용자가 보기 편하게 바꿔주는 메소드, Table안에 지정
function timeAppandProductStoreRating(element,language) {
	var time = timeAppand(element, 'RATDATE',language);
	element.lastChild.className = 'rating_time';
	element.lastChild.id = 'date';
}

//별 표시를 위한 span 테그 생성 및 리턴
function starRatingView(element,elementName,updatable){
	var divTag = document.createElement("div");
	divTag.id = elementName;
	divTag.setAttribute('name',elementName+"DIV");
	var i;
	for(i=1 ; i<=5; i++){
		var star = document.createElement('span');
		star.className="fa fa-star-o";
		star.setAttribute("data-rating", i);
		divTag.appendChild(star);
	}
	starRating(element, divTag, updatable);
	return divTag;
}

var isEmpty = function(value){
	 	 if( value =="null"|| value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
	 		 return false;
	 	 } else{
	 		 return true;
	 	 }
	 }
