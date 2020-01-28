;jQport = jQuery.noConflict();
jQport(document).ready(function($){
	
  // init Isotope
	var $container = $('#container-isotope').isotope({
	  itemSelector: '.item',
	  layoutMode : 'masonry',
	  /*masonry: {
		 columnWidth: '.item',
	  }*/
	});
	$container.imagesLoaded( function() {
	  	$container.isotope('layout');
	});
	// filter items on button click
	$('#filter li').on( 'click', 'a', function(e) {
		e.preventDefault();
	  	var filterValue = $(this).attr('data-filter');
		$('#filter li a').removeClass('active');
		$(this).addClass('active');
	  	$container.isotope({ filter: filterValue });
	});

})