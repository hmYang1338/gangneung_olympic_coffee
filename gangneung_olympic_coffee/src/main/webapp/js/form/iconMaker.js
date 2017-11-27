/**
 * @author 신승엽
 */

//아이콘을 제작함
function iconMaker(element, className, src, listener){
	var icon = document.createElement('span');
	icon.className = className;
	var iconImage = document.createElement('img');
	iconImage.src = src;
	icon.appendChild(iconImage);
	icon.addEventListener('click',listener);
	element.appendChild(icon);
}