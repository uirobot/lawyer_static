$(function () {
  $("#slider").responsiveSlides({
    auto: false,
    pager: false,
    pager: true,
    speed: 500,
    
  });

});

            if ($(window).width() < 992) { // Only if device's width is smaller than 992px
                var slides = jQuery('.rslides'),
                    i = 0;
                slides
                .on('swipeleft', function(e) {
                  $('.rslides_nav.next').click();
                  $(".rslides").mouseenter();
                  setTimeout(function() {   $(".rslides").mouseleave(); }, 2000); // Delay automatic sliding for 2seconds after swiping
                })
                .on('swiperight', function(e) {
                  $('.rslides_nav.prev').click();
                  $(".rslides").mouseenter();
                  setTimeout(function() {   $(".rslides").mouseleave(); }, 2000); // Delay automatic sliding for 2seconds after swiping
                });

                // If the movestart is heading off in an upwards or downwards direction, prevent it so that the browser scrolls normally.
                jQuery('.rslides')
                .on('movestart', function(e) {
                  if ((e.distX > e.distY && e.distX < -e.distY) ||
                      (e.distX < e.distY && e.distX > -e.distY)) {
                    e.preventDefault();
                  }
                });
            }