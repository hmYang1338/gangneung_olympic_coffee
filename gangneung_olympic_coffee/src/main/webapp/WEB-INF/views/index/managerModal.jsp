<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
  <!-- 관리자 모달 -->
<style>
/* 사용자 재정의 */
.modal-lg{
max-width: 1100px;
}
</style>

	<div class="modal fade" id="manager-modal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content container blue-background" id="modal-manager">
			</div>
		</div>
	</div>