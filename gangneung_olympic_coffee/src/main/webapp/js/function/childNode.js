/**
 * 자식 객체를 리턴하는 함수
 * @author 신승엽
 */

function elementChildSelectorName(element,childName){
	var elements = element.childNodes;
	var child;
	var i = 0;
	for(i;i<elements.length;i++){
		try{f
			if(elements[i].getAttribute('name')==childName){
				child=elements[i];
				break;
			}
		} catch(Exception){}
	}
	return child;
}

function elementChildSelectorClass(element,childClass){
	var elements = element.childNodes;
	var child;
	var i = 0;
	for(i;i<elements.length;i++){
		if(elements[i].className==childClass){
			child=elements[i];
			break;
		}
	}
	return child;
}
