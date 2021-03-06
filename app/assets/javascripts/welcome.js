$(function () {
    
    $('.friend-column').on('click', function() {
        let current = window.location.href.split('/');
        window.location.href = current[0] + "/" + "uk" + "/" + this.id;
    });

    var stickyToggle = function(sticky, stickyWrapper, scrollElement) {
        var stickyHeight = sticky.outerHeight();
        var stickyTop = stickyWrapper.offset().top;
        if (scrollElement.scrollTop() >= stickyTop){
          stickyWrapper.height(stickyHeight);
          sticky.addClass("is-sticky");
        }
        else{
          sticky.removeClass("is-sticky");
          stickyWrapper.height('auto');
        }
      };
      
      // Find all data-toggle="sticky-onscroll" elements
      $('[data-toggle="sticky-onscroll"]').each(function() {
        var sticky = $(this);
        var stickyWrapper = $('<div>').addClass('sticky-wrapper'); // insert hidden element to maintain actual top offset on page
        sticky.before(stickyWrapper);
        sticky.addClass('sticky');
        
        // Scroll & resize events
        $(window).on('scroll.sticky-onscroll resize.sticky-onscroll', function() {
          stickyToggle(sticky, stickyWrapper, $(this));
        });
        
        // On page load
        stickyToggle(sticky, stickyWrapper, $(window));
      });
      

      $( '.dropdown' ).on( 'show.bs.dropdown', function() {
        $( this ).find( '.dropdown-menu' ).first().stop( true, true ).slideDown( 150 );
      } );
      $('.dropdown').on( 'hide.bs.dropdown', function(){
        $( this ).find( '.dropdown-menu' ).first().stop( true, true ).slideUp( 150 );
      } );

      $( window ).resize(function() {
        if($(window).width() > 500 && $(window).width() <= 1024) {
          $('.announcements-row').addClass("no-gutters");
        } 
        else {
          $('.announcements-row').removeClass("lg-2x");
        }
      });

     
}); 
