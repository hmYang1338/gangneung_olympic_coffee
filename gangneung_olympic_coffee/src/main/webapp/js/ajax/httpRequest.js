/** 
 * 다수의 비동기 통신을 하기 위하여 httpRequest를 리턴하는 함수
 * @author 신승엽
 * */
function sendRequest(url, params, callback, method) {
	var httpRequest = new XMLHttpRequest();
	var httpMethod = method;	
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}		
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	
	httpRequest.onreadystatechange = callback;
	
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
	
	return httpRequest;
}