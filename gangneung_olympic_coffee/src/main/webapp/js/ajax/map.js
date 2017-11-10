var map;

mapStart();

function mapStart() {
	let infoWindow;
	window.initMap = function() {
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 0,
				lng : 0
			},
			zoom : 16
		});
		infoWindow = new google.maps.InfoWindow({
			map : map
		}); infoWindow.setContent("현위치");
	};
	function successCallback(position) {
		let pos = {
			lat : position.coords.latitude,
			lng : position.coords.longitude
		};
		infoWindow.setPosition(pos); map.setCenter(pos); 
		recent(pos.lat,pos.lng);
	}
	function errorCallback(error) {
		alert("Error: " + error.message);
	}
	navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
}
