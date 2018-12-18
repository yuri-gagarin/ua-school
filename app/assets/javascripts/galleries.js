$(document).ready(function() {
    
    $(".gal-modal-close").on("click", function() {
        $(this).parent().modal('toggle');
    });


    $(document).scroll(function() {
        $(".main-gal-item").each(function(i){
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            if( bottom_of_window > bottom_of_object ){    
                $(this).addClass("main-gal-item-show");
            }
        })
    });
});
