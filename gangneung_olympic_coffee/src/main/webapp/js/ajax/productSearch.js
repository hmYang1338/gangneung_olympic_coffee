/**
 * @author 신승엽
 */
var productSearchRequest;

function productSearchBtn(){
	var product = document.getElementById('productSearch').value;
	productSearchRequest = sendRequest("productSelectByName.do","product="+product,productSearchAjax,"GET");
}

function productSearchAjax(){
	if (productSearchRequest.readyState == 4 && productSearchRequest.status == 200) {
		window.alert(productSearchRequest.responseText);
//		var data = {
//				'json' : storeSelectByIdRequest.responseText,
//				'column' : ['name','tel','addr','storeHours'],
//				'columnId' :['store-name','tel','addr','storeHours'],
//				'columnClass' : ['store-name','','',''],
//				'elementId' : 'storeView',
//				'innerSet' : {
//						hiddenColumn:['id','lat','longi','smokingRoom','storeUrl','img','storeSource'],
//						divId:'sinnerDiv',
//						divClass:'bg-gray',
//						tableId:'sinnerTableDiv',
//						tableClass:'text-center store-info col-sm-12'
//				},
//				'innerFunction' : storeExecute,
//				'executeFunction' : storeExecutePlus
//		};
//		listView(data);
	}
}