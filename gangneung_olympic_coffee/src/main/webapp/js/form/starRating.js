/**
 * id -> class id
 * editable -> boolean 편집 가능한가 여부
 * @author 신승엽
 */

function starRating(elementId,element, editable){
	var $star_rating = $('.'+element.className);
	console.log(element.className);
	console.log($star_rating.siblings("#"+elementId).val());
	var SetRatingStar = function() {
	  return $star_rating.each(function() {
	    if (parseInt($star_rating.siblings("#"+elementId).val()) >= parseInt($(this).data('rating'))) {
	      return $(this).removeClass('fa-star-o').addClass('fa-star');
	    } else {
	      return $(this).removeClass('fa-star').addClass('fa-star-o');
	    }
	  });
	};

	SetRatingStar();
	
	if (editable) {
		$star_rating.on('click', function() {
			$star_rating.siblings("#"+elementId).val($(this).data('rating'));
			return SetRatingStar();
		});
	}

	
	$(document).ready(function() {

	});	
}
