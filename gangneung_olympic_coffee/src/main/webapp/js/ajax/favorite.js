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
						divId:'sinnerDiv2',
						divClass:'bg-gray',
						tableId:'sinnerTableDiv',
						tableClass:'text-center store-info col-sm-12'
				},
				'innerFunction' : storeFavoriteListDelete,
		};
		listView(data);
	}
}

function storeFavoriteListDelete(element){
	var lastChild = element.lastChild;
	var deleteDiv = document.createElement('span');
	iconMaker(deleteDiv, 'product-icon', 'img/coffee-menu.svg', function(e) {
		var favNum = elementChildSelectorName(element, 'FAVNUM').value;
		storeFavoriteDeleteBtn(favNum);
	});
	deleteDiv.className = 'cursor favorite-delete-span';
//	deleteDiv.addEventListener("click", function() {
//		console.log('abcd');
//	});
	lastChild.appendChild(deleteDiv);
}

var storeFavoriteDelete;
function storeFavoriteDeleteBtn(favNum){
	storeFavoriteDelete = sendRequest("deleteStoreFavorite.do", "favNum="+favNum, null, "GET");
}