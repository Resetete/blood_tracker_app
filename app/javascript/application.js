// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import $ from "jquery"
// window.jQuery = jquery
// window.$ = jquery
import 'controllers'
import * as bootstrap from "bootstrap"
import "@nathanvda/cocoon"

$(document).on('turbo:load', function() {
  // resizes the navbar logo and brand when scrolling down 80px from top
  window.onscroll = function() {scrollFunction()};

  function scrollFunction() {
    if (document.body.scrollTop > 10 || document.documentElement.scrollTop > 10) {
      $('.brand-image-wrapper').css('width', "15%");
      $('.brand-image-wrapper').css('position', 'inherit');
      $('#brand').css('font-size', "1em");
      $('#brand').css('position', 'inherit');
    } else {
      $('.brand-image-wrapper').css('width', "30%");
      $('.brand-image-wrapper').css('position', 'absolute');
      $('.brand-image-wrapper').css('top', '0');
      $('.brand-image-wrapper').css('left', '0');
      $('#brand').css('font-size', "2em");
      $('#brand').css('position', "absolute");
      $('#brand').css('left', "10vw");
      $('#brand').css('top', "3vh");
    }
  }

  // fade out alert flash messages
  $(function() {
    setTimeout(function() {
      $('.alert').fadeOut('slow');
    }, 5000);
  });
});