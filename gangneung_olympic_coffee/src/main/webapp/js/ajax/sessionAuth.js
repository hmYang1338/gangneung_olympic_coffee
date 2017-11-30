/**
 * 현재 서버의 세션 값을 받아와 현재의 권한 정보를 브라우저로 전송
 * @author 신승엽
 */

var sessionAuthAjax;
var auth;
(function(){
	var json;
	sessionAuthAjax = sendRequest("session.do", null, function(){
		if (sessionAuthAjax.readyState == 4 && sessionAuthAjax.status == 200) {
			json = sessionAuthAjax.responseText;
			console.log(json);
			auth = JSON.parse(json);
	}
	}, "POST");
})();
