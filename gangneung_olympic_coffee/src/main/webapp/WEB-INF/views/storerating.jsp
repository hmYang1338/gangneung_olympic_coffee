<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

	<form action="insertStoreRating.do" method="GET">
		<input type="number" name="id" id="id" min="1" max="14" step="1">
		<br>
		interior:
		<input type="range" name="interior" id="interior" min="0" max="5" step="1">
		<br>
		access:
		<input type="range" name="ratAccess" id="ratAccess" min="0" max="5" step="1">
		<br>
		cost_effect:
		<input type="range" name="costEffect" id="costEffect" min="0" max="5" step="1">
		<br>
		<input type="text" name="ratComment" id="ratComment">
		<br>
		<input type="submit">&nbsp;&nbsp;&nbsp;<input type="reset">
	</form>
