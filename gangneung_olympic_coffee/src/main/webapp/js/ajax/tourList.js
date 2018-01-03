/**
 * @author 신승엽
 */

var slideIndex = 1;
var tourListRequest;
var tourListStr = ['','Tourist List','관광지 목록','旅游名单'];

function tourList(){
	var touristList = document.getElementById('touristList');
	touristList.innerHTML = '';
	var title = document.createElement('h2');
	title.appendChild(document.createTextNode(tourListStr[lanCode]));
	title.className = 'tour-title';
	touristList.appendChild(title);
	tourListRequest = sendRequest("tourList.do", null, tourListAjax, "POST");
}

function tourListAjax() {
	if (tourListRequest.readyState == 4 && tourListRequest.status == 200) {
		var data ={
				'json': tourListRequest.responseText,//json 객체
				'elementId' : 'touristList', //넣으려는 div의 id 값
				'column' : ['name'],
				'columnId' :['name'],
				'columnClass' : ['name cursor'],
				'innerSet' : {
						'hiddenColumn' : ['name','id','tourSource'],
						'divClass' : '',
						'divId' : '',
						'tableClass' : 'tour-list pic col-xs-6 col-ms-4 col-md-4 col-lg-4',
						'tableId' : ''
				},
				'innerFunction' : tourSelectById,
		};
		listView(data);
	}
}

function tourSelectById(element){
	element.addEventListener("click",function(){
		slideIndex = 1;
		var name = elementChildSelectorName(element,'name').value;
		var source = elementChildSelectorName(element,'tourSource').value;
		source +='<a class="btn-floating" id="left-move" style="position:absolute;top:45%;left:0" onclick="plusDivs(-1)">❮</a><a class="btn-floating" id="right-move" style="position:absolute;top:45%;right:0" onclick="plusDivs(1)">❯</a>';
		$(document).ready(function() {
			var modalView = document.getElementById('store-modal-view');
			modalView.innerHTML='';
			var innerModalView = document.createElement('div');
			innerModalView.className = "tour-modal";
			innerModalView.id = "tour-modal";
			innerModalView.innerHTML=source;
			
			var tourName = document.createElement('div');
			tourName.className = "tour-name";
			tourName.id = "tour-name";
			tourName.appendChild(document.createTextNode(name));
			
			iconMaker(tourName, 'tour_icon cursor', 'img/info.svg', function(e){
				window.open('https://www.google.com/search?q='+name);
			});
			
			modalView.appendChild(tourName);
			modalView.appendChild(innerModalView);
			$("#store-modal").modal();
			showDivs(slideIndex);
		});
	});
}

function plusDivs(n) {
    showDivs(slideIndex += n);
}

function showDivs(n) {
    var i;
    var x = document.getElementById('tour-modal').getElementsByTagName("img");
    var left = document.getElementById('left-move');
    var right = document.getElementById('right-move');
    if (n > x.length) {slideIndex = 1} 
    if (n < 1) {slideIndex = x.length} ;
    if (n == 1) {left.style.display = "none";} else {left.style.display = "block";}
    if (n == x.length) {right.style.display = "none";} else {right.style.display = "block";}
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none"; 
    }
    x[slideIndex-1].style.display = "block"; 
}