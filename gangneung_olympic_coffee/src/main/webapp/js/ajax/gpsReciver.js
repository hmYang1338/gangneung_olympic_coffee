/**
 * 사용자의 위치 정보를 비동기 방식으로 받아오는 js
 * @author 신승엽
 */

var gpsRequest;
getLocation();

function gpsTester() {
	if (gpsRequest.readyState == 4 && gpsRequest.status == 200) {
		var json = gpsRequest.responseText;
		json = JSON.parse(json);
		console.log(json[0].lat,json[0].longi);
	}
}

function getLocation() {
  if (navigator.geolocation) { // GPS를 지원하면
    navigator.geolocation.getCurrentPosition(function(position) {
      var gps = 'lat='+position.coords.latitude+
            '&longi='+position.coords.longitude;
      gpsRequest = sendRequest("gps.do", gps, gpsTester, "POST");
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
