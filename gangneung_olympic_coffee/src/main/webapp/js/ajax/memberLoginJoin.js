/**
 * 비동기 통신을 하여 innerHTML로 로그인과 회원가입 페이지를 받아옵니다.
 * @author 신승엽
 */
var memberLogin;
function loginBtn(){
	memberLogin = sendRequest("loginBtn.do", null, memberLoginAjax, "GET");
}

//받아온 ajax 객체를 DIV로 출력
function memberLoginAjax() {
	if (memberLogin.readyState == 4 && memberLogin.status == 200) {
		$(document).ready(function() {
			$("#loginLP").modal();
			$("#modalMember").html(memberLogin.responseText);
		});	
	}
}