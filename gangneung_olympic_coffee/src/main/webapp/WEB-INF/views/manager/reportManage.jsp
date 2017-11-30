<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style type="text/css">
.brown-background{
		background: #f2e6d9;
	}
	.brown{
		color: #996633;
	}
	.blue-background{
		background: #f0f0f5;
	}
	.blue{
		color: #666699;
	}
	.radius{
		border-width: 3px;
		border-color: white;
	}
	.radius:hover{
		background-color:white;
		color:black;
	}
	
	.raio-group{
		margin-left: 10%;
		margin-bottom: 1px;
	}
	
	.hr-white{
		border-top: 3px solid #f8f9fa;
	}
	
	/* 아래부터는 재정의 */
	.control-label{
	    cursor: default;
	    font-size: large;
	}
	.pull-right {
	    float: right!important;
	    margin-right: 20px;
	}
	.btn-bottom-margin{
		margin-bottom: 20px;
	}
</style>
	
<!-- 신고 관리창 구현 -->
<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>

<hr class="hr-white">
<h3 class="blue text-center">신고 관리</h3>
<hr class="hr-white">
<span class="btn btn-default btn-bottom-margin">
<input type="button"
		class="btn btn-default btn-bottom-margin" style="width: 350px" id="list"
		name="list" onclick="reportListBtn();" value="신고 조회"> 			
</span>

<div id="reportingListView"></div>



