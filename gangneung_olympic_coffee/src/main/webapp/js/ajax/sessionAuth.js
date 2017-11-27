/**
 * 현재 서버의 세션 값을 받아와 현재의 권한 정보를 브라우저로 전송
 * @author 신승엽
 */

var sessionAuthAjax;

function checkSession(){
	var auth = 0;
	sessionAuthAjax = sendRequest("session.do", null, function(){
		auth = parseInt(sessionAuthAjax.responseText);
	}, "POST");
	console.log(auth);
	return auth;
}