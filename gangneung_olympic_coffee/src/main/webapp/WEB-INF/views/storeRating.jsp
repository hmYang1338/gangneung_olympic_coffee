<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style type="text/css">
	
	.hr-white{
		border-top: 3px solid #f8f9fa;
	}
	.control-label{
	    cursor: default;
	    font-size: large;
	}
	.view-left-margin{
		margin-left: 13%;
		margin-bottom: 1px;
	}
	.btn-bottom-margin{
		margin-bottom: 20px;
	}
	.btn-left-margin{
		margin-left: 20px;
	}
</style>

	<form action="insertStoreRating.do" method="GET">
	<hr class="hr-white">
	<h3 class="blue text-center"><spring:message code="site.store.storeRating"/></h3><hr class="hr-white">
		<div id ="insertStoreRatingForm">
			<input type="hidden" name="id" id="id" value="${param.id}">
			<label for="interior" class="control-label blue">Interior&nbsp;:&nbsp;</label>
			<div id="interior_view" class="view-left-margin"></div>
			<input type="hidden" name="interior" id="interior" min="0" max="5" step="1">
			<br>
			<label for="ratAccess" class="control-label blue">Access&nbsp;:&nbsp;</label>
			<div id="access_view" class="view-left-margin"></div>
			<input type="hidden" name="ratAccess" id="ratAccess" min="0" max="5" step="1">
			<br>
			<label for="costEffect" class="control-label blue">Cost_Effect&nbsp;:&nbsp;</label>
			<div id="cost_effect_view" class="view-left-margin"></div>
			<input type="hidden" name="costEffect" id="costEffect" min="0" max="5" step="1">
			<br>
			<label for="ratComment" class="control-label blue">Comment&nbsp;:&nbsp;</label>
			<textarea class="form-control input-lg blue" name="ratComment" id="ratComment" placeholder="300자 이내로 써주세요." rows="2" cols=""></textarea>
			<br>
			<input type="submit" class="btn btn-default pull-right btn-left-margin btn-bottom-margin">
			<input type="reset" class="btn btn-default pull-right btn-bottom-margin">
		</div>
	</form>
