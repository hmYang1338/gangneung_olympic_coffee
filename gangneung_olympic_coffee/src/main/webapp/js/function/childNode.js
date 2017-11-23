/**
 * 자식 객체를 리턴하는 함수
 * @author 신승엽
 */


//
function elementChildselector(element,childeName){
	console.log(element);
	var elements = element.childNodes;
	var i = 0;
	
	for(i;i<elements.length;i++){
		console.log(elements[i].name);
		//if(elements[i].name)
	}
}