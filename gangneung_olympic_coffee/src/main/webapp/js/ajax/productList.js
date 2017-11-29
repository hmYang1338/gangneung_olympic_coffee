/**
 * 메뉴 리스트를 제작하는 함수
 * @author 신승엽
 */

var productListAjax;

function menuList(id){
	productListAjax = sendRequest("productSelectById.do", 'id='+id, menuListAjax, "POST");
}

function menuListAjax() {
	if (productListAjax.readyState == 4 && productListAjax.status == 200) {
		var data ={
				'json': productListAjax.responseText,//json 객체
				'column' : ['product','hotPrice','icePrice'], //JSON객체의 열 이름
				'columnId' : ['product','hotPrice','icePrice'], //행 id
				'columnClass' : ['product-name','price','price'], //행 class
				'elementId' : 'store-modal-view', //넣으려는 div의 id 값
				'innerSet' : {
						'hiddenColumn' : ['lanCode','id','code','oz'],
						'divClass' : 'menu_list',
						'divId' : '',
						'tableClass' : '',
						'tableId' : ''
				},
				'innerFunction' : menuExecute
		};
		listView(data);
	}
}

function menuExecute(element){
	//HOT, ICE 문구 추가 및 0원을 '-'으로 치환해 주는 작업
	var spanName = ['HOT','ICE'];
	var priceElements = [elementChildSelectorName(element,'hotPrice'),elementChildSelectorName(element,'icePrice')];
	var i = 0;
	for(i;i<spanName.length;i++){
		if(priceElements[i].innerText == 0){
			priceElements[i].innerText = '-';
		}
		priceSpan = document.createElement('span');
		priceSpan.className = spanName[i];
		priceSpan.appendChild(document.createTextNode(spanName[i]));
		priceElements[i].appendChild(priceSpan);
	}
	//제품 목록 즐겨찾기 추가
	//정태준 - 수정함 Git충돌 방지
	productElement = elementChildSelectorName(element,'product');
	iconMaker(productElement,'product-icon','img/coffee-menu.svg',function(){
		var id = elementChildSelectorName(element,'id').value;
		var code = elementChildSelectorName(element,'code').value;
		var oz = elementChildSelectorName(element,'oz').value;
		//alert(code+" "+id+" "+oz)
		productFavoriteInsertBtn(id,code,oz);
	});
	//product - 정태준
	productRatingElement = elementChildSelectorName(element,'product');
	iconMaker(productRatingElement,'product-icon','img/coffee-icon.svg',function(){
		var id = elementChildSelectorName(element,'id').value;
		var code = elementChildSelectorName(element,'code').value;
		var oz = elementChildSelectorName(element,'oz').value;
		productRatingInsertBtn(id,code,oz);
	});
}