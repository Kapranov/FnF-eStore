//= require jquery2
//= require jquery_ujs
//= require bootstrap-sprockets
//= require pace/pace.min.js
//= require classie/classie.js

// INSPINIA Landing Page Custom scripts
$(document).ready(function () {

    // Highlight the top nav as scrolling
    $('body').scrollspy({
        target: '.navbar-fixed-top'
    })

    // Page scrolling feature
    $('a.page-scroll').bind('click', function(event) {
        var link = $(this);
        $('html, body').stop().animate({
            scrollTop: $(link.attr('href')).offset().top
        }, 500);
        event.preventDefault();
    });
});
