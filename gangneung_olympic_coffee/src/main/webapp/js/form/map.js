/**
 * 브라우저의 GPS 정보를 가지고 와서 현재 위치의 지도를 표시함.
 * @author 신승엽
 */

var initMap = function(mapLat, mapLongi){
        	var map = new google.maps.Map(document.getElementById('store-modal-view'), {
                zoom: 11,
                center: {lat: mapLat,lng: mapLongi}
              });
        	new google.maps.Marker({
                position: {lat: mapLat,lng: mapLongi},
                map: map
              });
}
