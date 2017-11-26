/**
 * id -> class id
 * editable -> boolean 편집 가능한가 여부
 * @author 신승엽
 */

function starRating(element, tag, updatable){
	var $star_rating;
	
	var setRatingStar = function() {
	  return $star_rating.each(function() {
	    if (parseInt($(element).val()) >= parseInt($(this).data('rating'))) {
	      return $(this).removeClass('fa-star-o').addClass('fa-star');
	    } else {
	      return $(this).removeClass('fa-star').addClass('fa-star-o');
	    }
	  });
	};

	$(document).ready(function() {
		$star_rating = $(tag).children();
		setRatingStar();
		if (updatable) {
			$star_rating.click(function() {
				$(element).val($(this).data('rating'));
				return setRatingStar();
			});
		}
	});	
	
}
