/**
 * 신고리스트
 * @author 양현모
 */

//관리자 화면 실행시 비동기 통신으로 신고 목록을 출력함
var reportingListRequest = sendRequest("selectReporting.do", null, reportListBtn, "POST");

//받아온 ajax 객체를 DIV로 출력
function reportListBtn() {
	if (reportingListRequest.readyState == 4 && reportingListRequest.status == 200) {
		var data ={
				'json': reportingListRequest.responseText,//json 객체
				'column' : ['seq','email','sratNum','pratNum','repDate'], //JSON객체의 열 이름
				'columnId' : ['seq','email','sratNum','pratNum','repDate'], //열 id
				'columnClass' : ['divTableCell','divTableCell','divTableCell','divTableCell','divTableCell'], //열 class
				'elementId' : 'reportingListView', //넣으려는 div의 id 값
				'innerSet' : {
						divId:'innerDiv',
						divClass:'divTableBody',
						tableId:'innerTableDiv',
						tableClass:'divTableRow',
				}
				/*'innerFunction' : managerSelectByEmail,*/
		};
		listView(data);
	}
}