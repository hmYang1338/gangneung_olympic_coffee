/**
 * timestamp를 시간으로 변환
 * @author 신승엽
 */

function timeConverter(timestamp,language){
	var a = new Date(Number(timestamp));
	var months = [[],['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
					['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
		];
	var year = a.getFullYear();
	var month = months[language][a.getMonth()];
	var date = a.getDate();
	var hour = a.getHours();
	var min = a.getMinutes();
	var sec = a.getSeconds();
	var time;
	switch (language) {
	case 2:
		time = year+'년 '+month+' '+date+"일 "+ hour+":"+sec;
		break;
	case 3:
		time = year+'年 '+month+' '+date+"日 "+ hour+":"+sec;
		break;
	default:
		time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min;
		break;
	}
	return time;
}

//시간을 추가해주는 메소드
function timeAppand(element,name,language){
	var time = document.createElement('div');
	time.appendChild(document.createTextNode(timeConverter(elementChildSelectorName(element,name).value,language)));
	time.setAttribute('name',name+'TIME');
	element.appendChild(time);
}
