
$(document).ready(function() {
  var update = function(data) {

    var output = '';

    output += '<div class="slider-wrapper"><div id="slider" class="nivoSlider">';

    for(var i=0; i < data.length; i++) {
      output += '<img src="' + data[i].file + '" title="' + data[i].caption + '">';
    }
    
    output += "</div></div>";

    $('.slideshow').append(output);
    $('.slider-wrapper').addClass('theme-light');
    $('#slider').nivoSlider({
      effect: 'random', // Specify sets like: 'fold,fade,sliceDown'
      slices: 15, // For slice animations
      boxCols: 8, // For box animations
      boxRows: 4, // For box animations
      animSpeed: 1000, // Slide transition speed
      pauseTime: 6000, // How long each slide will show
      startSlide: 0, // Set starting Slide (0 index)
      directionNav: true, // Next & Prev navigation
      directionNavHide: true, // Only show on hover
      controlNav: true, // 1,2,3... navigation
      controlNavThumbs: false, // Use thumbnails for Control Nav
      pauseOnHover: true, // Stop animation while hovering
      manualAdvance: false, // Force manual transitions
      prevText: 'Prev', // Prev directionNav text
      nextText: 'Next', // Next directionNav text
      randomStart: false, // Start on a random slide
      beforeChange: function(){}, // Triggers before a slide transition
      afterChange: function(){}, // Triggers after a slide transition
      slideshowEnd: function(){}, // Triggers after all slides have been shown
      lastSlide: function(){}, // Triggers when last slide is shown
      afterLoad: function(){} // Triggers when slider has loaded
    });
  };
 
  //Use the title element of the slideshow div to determine which slideshow to show. 
  var slideshow = $('.slideshow').attr('title');
  var imgurl = journalUrl + '/slideshow/view/index?s=' + slideshow;
  $.ajax({url:imgurl, success:update , dataType:'json'});
});
