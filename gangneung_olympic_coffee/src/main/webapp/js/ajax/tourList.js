/**
 * @author 신승엽
 */

var slideIndex = 1;
var tourListRequest;
function tourList(){
	document.getElementById('touristList').innerHTML='';
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
		source +='<a class="btn-floating" style="position:absolute;top:45%;left:0" onclick="plusDivs(-1)">❮</a><a class="btn-floating" style="position:absolute;top:45%;right:0" onclick="plusDivs(1)">❯</a>';
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
			
			iconMaker(tourName, 'tour_icon', 'img/info.svg', function(e){
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
    if (n > x.length) {slideIndex = 1} 
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none"; 
    }
    x[slideIndex-1].style.display = "block"; 
}