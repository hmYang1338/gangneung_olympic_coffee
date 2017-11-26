<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

	<form action="insertStoreRating.do" method="GET">
		<div id ="insertStoreRatingForm">
		<input type="number" name="id" id="id" min="1" max="14" step="1">
		<br>
		interior:<div id="interior_view"></div>
		<input type="hidden" name="interior" id="interior" min="0" max="5" step="1">
		<br>
		access:<div id="access_view"></div>
		<input type="hidden" name="ratAccess" id="ratAccess" min="0" max="5" step="1">
		<br>
		cost_effect:<div id="cost_effect_view"></div>
		<input type="hidden" name="costEffect" id="costEffect" min="0" max="5" step="1">
		<br>
		<input type="text" name="ratComment" id="ratComment">
		<br>
		<input type="submit">&nbsp;&nbsp;&nbsp;<input type="reset">
		</div>
	</form>
s