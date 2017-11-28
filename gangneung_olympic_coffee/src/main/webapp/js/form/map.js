/**
 * 브라우저의 GPS 정보를 가지고 와서 현재 위치의 지도를 표시함.
 * @author 신승엽
 */

  function setGPS(lati,longi) {
	var location = new google.maps.LatLng(parseFloat(lati), parseFloat(longi));

	var mapOptions = {
		center : location,
		zoom : 18, 
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("store-modal-view"), 
	mapOptions);

	var marker;
	marker = new google.maps.Marker({
		position : location,
		map : map,
	});

	var content = "HERE";

	var infowindow = new google.maps.InfoWindow({
		content : content
	});

	google.maps.event.addListener(marker, "click", function() {
		infowindow.open(map, marker);
	});

}

//
// var myLatLng;
//
// function setGPS(lati,longi){
// myLatLng = new google.maps.LatLng(parseFloat(lati),parseFloat(longi));
// // myLatLng = {lat:parseFloat(lati),lng:parseFloat(longi)};
// initMap();
// };
// 
// function initMap() {
// var map = new google.maps.Map(document.getElementById('store-modal-view'), {
// zoom: 12,
// center: myLatLng
//  });
//
//  var marker = new google.maps.Marker({
//    position: myLatLng,
//    map: map,
//  });
//
//  map.addListener('center_changed', function() {
//    window.setTimeout(function() {
//      map.panTo(marker.getPosition());
//    }, 3000);
//  });
//
//  marker.addListener('click', function() {
//    map.setZoom(12);
//    map.setCenter(marker.getPosition());
//  });
//}
//
//
