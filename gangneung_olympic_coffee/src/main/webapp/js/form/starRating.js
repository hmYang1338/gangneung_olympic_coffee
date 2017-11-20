/**
 * id -> class id
 * editable -> boolean 편집 가능한가 여부
 * @author 신승엽
 */

function starRating(elementName, element, index, editable){
	var $star_rating = $('#'+elementName+index+" .fa");
	var splitClass = element.className.split(' ');
	var SetRatingStar = function() {
	  return $star_rating.each(function() {
	    if (parseInt($('.'+splitClass[1]).children('#'+elementName).val()) >= parseInt($(this).data('rating'))) {
	      return $(this).removeClass('fa-star-o').addClass('fa-star');
	    } else {
	      return $(this).removeClass('fa-star').addClass('fa-star-o');
	    }
	  });
	};

	if (editable) {
		$star_rating.on('click', function() {
			$star_rating.siblings("#"+elementName).val($(this).data('rating'));
			return SetRatingStar();
		});
	}

	
	$(document).ready(function() {
		$star_rating = $('#'+elementName+index+" .fa");
		splitClass = element.className.split(' ');
		SetRatingStar();
	});	
}
