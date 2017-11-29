<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style type="text/css">
	.blue{
		color: #666699;
	}
	.hr-white{
		border-top: 3px solid #f8f9fa;
	}
	.btn-bottom-margin{
		margin-bottom: 20px;
	}
	.btn-center{
		width: 50%;
	}
</style>
	<form action="insertStoreFavorite.do" method="GET">
		<hr class="hr-white">
		<h3 class="blue text-center"><spring:message code="site.favorite.favorite"/></h3><hr class="hr-white">
		<input type="hidden" name="id" id="id" value="${param.id}">
		<div class="text-center">
			<input type="submit" class="btn btn-default btn-center btn-bottom-margin" value="<spring:message code="site.list.add"/>">
		</div>
	</form>