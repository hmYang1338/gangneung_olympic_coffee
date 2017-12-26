/**
 * @author 신승엽
 */
var productSearchRequest;

function productSearchBtn(){
	var product = document.getElementById('productSearch').value;
	productSearchRequest = sendRequest("productSelectByName.do","product="+product,productSearchAjax,"GET");
	$(document).ready(function() {
		var modalView = document.getElementById('store-modal-view');
		modalView.innerHTML='';
		$("#store-modal").modal();
	});
}

function productSearchAjax(){
	if (productSearchRequest.readyState == 4 && productSearchRequest.status == 200) {
		var data ={
				'json': productSearchRequest.responseText,//json 객체
				'column' : ['NAME','PRODUCT','HOTPRICE','ICEPRICE'], //JSON객체의 열 이름
				'columnId' : ['name','product','hotPrice','icePrice'], //행 id
				'columnClass' : ['name','product-name','price','price'], //행 class
				'elementId' : 'store-modal-view', //넣으려는 div의 id 값
				'innerSet' : {
						'hiddenColumn' : ['LANCODE','ID','CODE','OZ'],
						'divClass' : 'menu_list',
						'divId' : '',
						'tableClass' : '',
						'tableId' : ''
				},
				'innerFunction' : menuSearchExecute
		};
		listView(data);
	}
}

function menuSearchExecute(element){
	//HOT, ICE 문구 추가 및 0원을 '-'으로 치환해 주는 작업
	var spanName = ['HOT','ICE'];
	var priceElements = [elementChildSelectorName(element,'hotPrice'),elementChildSelectorName(element,'icePrice')];
	var i = 0;
	for(i;i<spanName.length;i++){
		if(priceElements[i].innerText=='undefined'){
			priceElements[i].innerText = '-';
		}
		priceSpan = document.createElement('span');
		priceSpan.className = spanName[i];
		priceSpan.appendChild(document.createTextNode(spanName[i]));
		priceElements[i].appendChild(priceSpan);
	}
if(auth.authority==1){
	productElement = elementChildSelectorName(element,'product');
	iconMaker(productElement,'product-icon','img/coffee-menu.svg',function() {
		var id = elementChildSelectorName(element,'ID').value;
		var code = elementChildSelectorName(element,'CODE').value;
		var oz = elementChildSelectorName(element,'OZ').value;
		//alert(id + " " + code + " " + oz);
		var modalView = document.getElementById('store-modal-view');
		modalView.innerHTML='';
		productFavoriteInsertBtn(id,code,oz);
	});
	}
if(auth.authority==1){
	productRatingElement = elementChildSelectorName(element,'product');
	iconMaker(productRatingElement,'product-icon','img/coffee-icon.svg',function(){
		var id = elementChildSelectorName(element,'ID').value;
		var code = elementChildSelectorName(element,'CODE').value;
		var oz = elementChildSelectorName(element,'OZ').value;
		//alert(id+" "+code+" "+oz);
		var modalView = document.getElementById('store-modal-view');
		modalView.innerHTML='';
		productRatingBtn(id,code,oz);
	});
	}
}