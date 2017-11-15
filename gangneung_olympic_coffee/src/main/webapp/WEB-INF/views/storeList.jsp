<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#innerDiv div{
		background-color: skyblue;
	}
	#innerTableDiv div{
		border-color: blue;
		border-style: solid;
		border-width: 1px;
	}
	#innerDiv > #name{
		background-color: pink;
	}
</style>
</head>
<body>
      <div class="container">
        <div class="row text-center">
          <div class="col-lg-10 divTable" id="storeListView">
          
          </div>
        </div>
      </div>
   <!-- 사용자 지정 js 추가 -->
	 <script src="js/ajax/httpRequest.js"></script>
	<script src="js/form/listView.js"></script>
	<script src="js/ajax/storeList.js"></script>
	<!-- <script type="text/javascript">
	//메인 화면 실행시 비동기 통신으로 커피숍 목록을 출력함
	var storeListRequest = sendRequest("storeListMap.do", "lanCode=1", storeListAjax, "POST");
	var storeSelectByIdRequest;

	//받아온 ajax 객체를 DIV로 출력
	function storeListAjax() {
		if (storeListRequest.readyState == 4 && storeListRequest.status == 200) {
			var data ={
					'json': storeListRequest.responseText,//json 객체
					'column' : ['NAME','ADDR','STOREHOURS','PRODUCTRATING','STORERATING'], //JSON객체의 열 이름
					'columnId' : ['name','addr','storeHour','productRating','storeRating'], //열 id
					'columnClass' : ['divTableCell','divTableCell','divTableCell','divTableCell','divTableCell'], //열 class
					'elementId' : 'storeListView', //넣으려는 div의 id 값
					'innerSet' : {
							hiddenColumn:['ID'],
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
	</script> -->
</body>
</html>