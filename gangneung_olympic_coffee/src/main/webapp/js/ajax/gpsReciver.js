/**
 * 사용자의 위치 정보를 비동기 방식으로 받아오는 js
 * @author 신승엽
 */

var gpsRequest;
getLocation();

function gpsStore() {
	if (gpsRequest.readyState == 4 && gpsRequest.status == 200) {
		var json = gpsRequest.responseText;
		var column =['NAME','ADDR','STOREHOURS','PRODUCTRATING','STORERATING'];
		//json 객체로 받아온 컬럼명을 작성, 추후 객체를 가지고 올 때 사용
		var columnId =['name','addr','storeHour','productRating','storeRating'];
		//tag의 id 값을 지정하기 위하여 사용, css 적용을 위하여 설정 함
		storeListView(json,column,columnId,"gpsResultView","innerDiv","innerTableDiv");
	}
}

function getLocation() {
  if (navigator.geolocation) { // GPS를 지원하면
    navigator.geolocation.getCurrentPosition(function(position) {
      var gps = 'lat='+position.coords.latitude+
            '&longi='+position.coords.longitude;
      gpsRequest = sendRequest("nearByStore.do", gps, gpsStore, "POST");
    }, function(error) {
      console.error(error);
    }, {
      enableHighAccuracy: false,
      maximumAge: 0,
      timeout: Infinity
    });
  } else {
    alert('GPS를 지원하지 않습니다');
  }
}
