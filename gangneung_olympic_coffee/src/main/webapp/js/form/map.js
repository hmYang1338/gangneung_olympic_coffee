/**
 * 브라우저의 GPS 정보를 가지고 와서 현재 위치의 지도를 표시함.
 * @author 신승엽
 */

function initMap(lat,longi) {
  var uluru = {lat: lat, lng: longi};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: uluru
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
}
