
(function($) {
    "use strict";

    var path = window.location.href;
    $("#navbar li a.btn").each(function() {
        if (this.href === path) {
            $(this).addClass("active");
        }
    });

})(jQuery);