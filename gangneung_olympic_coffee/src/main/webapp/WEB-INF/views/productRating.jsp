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

	<form action="insertProductRating.do" method="GET">
	<hr class="hr-white">
	<h3 class="blue text-center"><spring:message code="site.product.productRating"/></h3><hr class="hr-white">
		<div id ="insertProductRatingForm">
			<input type="hidden" name="id" id="id" value="${param.id}">
			<input type="hidden" name="code" id="code" value="${param.code}">
			<input type="hidden" name="oz" id="oz" value="${param.oz}">
			<label for="taste" class="control-label blue">Taste&nbsp;:&nbsp;</label>
			<div id="taste_view" class="view-left-margin"></div>
			<input type="hidden" name="taste" id="taste">
			<br>
			<label for="ratComment" class="control-label blue">Comment&nbsp;:&nbsp;</label>
			<textarea class="form-control input-lg blue" name="ratComment" id="ratComment" placeholder="300자 이내로 써주세요." rows="2" cols=""></textarea>
			<br>
			<input type="reset" class="btn btn-default pull-left btn-bottom-margin">
			<input type="submit" class="btn btn-default pull-right btn-bottom-margin">
		</div>
	</form>
