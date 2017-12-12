/**
 * @author 신승엽
 */

var favoriteListRequest;
function favoriteListBtn(){
	var email = auth.email
	favoriteListRequest = sendRequest("/listStoreFavorite.do", "email="+email, favoriteListAjax, "POST");
}

function favoriteListAjax(){
	if (favoriteListRequest.readyState == 4 && favoriteListRequest.status == 200) {
		var data = {
				'json' : favoriteListRequest.responseText,
				'column' : ['NAME'],
				'columnId' :[''],
				'columnClass' : [''],
				'elementId' : 'favorite-list',
				'innerSet' : {
						hiddenColumn:['ID','TEL'],
						divId:'sinnerDiv',
						divClass:'bg-gray',
						tableId:'sinnerTableDiv',
						tableClass:'text-center store-info col-sm-12'
				}
		};
		listView(data);
	}
}
