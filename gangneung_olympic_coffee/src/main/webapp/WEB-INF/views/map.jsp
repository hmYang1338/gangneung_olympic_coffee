<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<section id="about" class="about">
	<div class="container text-center">
		<h1>Coffee</h1>
		<p class="lead" id="leadMsg"></p>
		<table id="mapList" class="w3-table w3-bordered" ></table>
	</div>
	<!-- /.container -->
</section>
<section id="contact" class="map">
	<div id="map" style="width: 100%; height: 500px; display: block;"></div>
	<small> </small>
</section>

<script src="js/ajax/httpRequest.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAleY05YLGGXlCg7fglyYbaxg1ygurk4IA&callback=initMap"></script>