;jQvan = jQuery.noConflict();
jQvan(document).ready(function($){
	$(document).foundation();
	
	var scrollPos = $(window).scrollTop();
	if(scrollPos >= 112){
		$('body').addClass('scrolled');
	}

	$(document).on('scroll', function(){
		scrollPos = $(window).scrollTop();
		if(scrollPos >= 112){
			$('body').addClass('scrolled');
		}else {
			$('body').removeClass('scrolled');
		}
	})
})