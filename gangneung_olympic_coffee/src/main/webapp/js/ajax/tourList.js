/**
 * @author 신승엽
 */

var slideIndex = 1;
var tourListRequest;
//showDivs(slideIndex);
///tourList.do
function tourList(){
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
						'hiddenColumn' : ['id','tourSource'],
						'divClass' : '',
						'divId' : '',
						'tableClass' : 'store-list pic col-xs-6 col-ms-4 col-md-4 col-lg-4',
						'tableId' : ''
				},
				'innerFunction' : tourSelectById,
		};
		listView(data);
	}
}

function tourSelectById(element){
	element.addEventListener("click",function(){
		var name = elementChildSelectorName(element,'name').value;
		var source = elementChildSelectorName(element,'tourSource').value;
		$(document).ready(function() {
			var modalView = document.getElementById('store-modal-view');
			modalView.innerHTML=source;
			$("#store-modal").modal();
		});
	});
}

function plusDivs(n) {
    showDivs(slideIndex += n);
}

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    if (n > x.length) {slideIndex = 1} 
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none"; 
    }
    x[slideIndex-1].style.display = "block"; 
}