/**
 * timestamp를 시간으로 변환
 * @author 신승엽
 */

function timeConverter(timestamp){
	var a = new Date(Number(timestamp));
	var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
	var year = a.getFullYear();
	var month = months[a.getMonth()];
	var date = a.getDate();
	var hour = a.getHours();
	var min = a.getMinutes();
	var sec = a.getSeconds();
	var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec ;
	return time;
}

//시간을 추가해주는 메소드
function timeAppand(element,name){
	var time = document.createElement('div');
	time.appendChild(document.createTextNode(timeConverter(elementChildSelectorName(element,name).value)));
	element.appendChild(time);
}