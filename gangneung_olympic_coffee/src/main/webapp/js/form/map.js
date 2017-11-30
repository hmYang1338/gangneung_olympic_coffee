/**
 * 브라우저의 GPS 정보를 가지고 와서 현재 위치의 지도를 표시함.
 * @author 신승엽
 */
var map;
function setMap(lati, lngi) {
	var gps = new google.maps.LatLng(lati, lngi);
	var mapCanvas = document.getElementById('map');
	var mapOptions = {
		zoom : 15,
		center : gps
	};
	var map = new google.maps.Map(mapCanvas, mapOptions);
	var marker = new google.maps.Marker({
		  position: gps,
		  map: map
	});
}

