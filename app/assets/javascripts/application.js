// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require best_in_place
//= require_tree .

$(function(){
      $("#slides").slidesjs({
		  play: {
			  active: true,
			  effect: "slide",
			  interval: 5000,
			  auto: true
		  }
	  });
    });
	
	new Morris.Line({
	  // ID of the element in which to draw the chart.
	  element: 'products_chart',
	  // Chart data records -- each entry in this array corresponds to a point on
	  // the chart.
	  data: $('#products_chart').data('products'),
	  // The name of the data record attribute that contains x-values.
	  xkey: 'created_at',
	  // A list of names of data record attributes that contain y-values.
	  ykeys: ['price', 'download_price'],
	  // Labels for the ykeys -- will be displayed when you hover over the
	  // chart.
	  labels: ['Total pris', 'Antall produkt'],
	  preUnits: '$'
	});

	$(window).load(function() {
		$('body').nivoZoom({
				speed:500,
				zoomHoverOpacity:0.8,
				overlay:false,
				overlayColor:'#333',
				overlayOpacity:0.5,
				captionOpacity:0.8
			});
	});
	
	$(function(){
	    $('#thumbnails img').each(function() {
	        var original_img_url = $(this).attr('data-zoom-url');
	        $(this)
	        .parent()
	        .zoom({url: original_img_url});
	    });
	});
	$('#myModal').html('$("<%= j render(:partial => new_employee_path ")');
	
	$(".alert-message").alert()
	$(".alert-message").alert('close')
