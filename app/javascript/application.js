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
  if (window.innerWidth >= 768){
    window.onscroll = function() {scrollFunction()};
  }

  function scrollFunction() {
    if (document.body.scrollTop > 10 || document.documentElement.scrollTop > 10) {
      $('.brand-image-wrapper-home').css('width', "15%");
      $('.brand-image-wrapper-home').css('position', 'inherit');
      $('.brand-home').css('font-size', "1em");
      $('.brand-home').css('position', 'inherit');
    } else {
      $('.brand-image-wrapper-home').css('width', "30%");
      $('.brand-image-wrapper-home').css('position', 'absolute');
      $('.brand-image-wrapper-home').css('top', '0');
      $('.brand-image-wrapper-home').css('left', '0');
      $('.brand-home').css('font-size', "2em");
      $('.brand-home').css('position', "absolute");
      $('.brand-home').css('left', "10vw");
      $('.brand-home').css('top', "3vh");
    }
  }

  // fade out alert flash messages
  $(function() {
    setTimeout(function() {
      $('.alert').fadeOut('slow');
    }, 5000);
  });

  // cookie banner
  if(localStorage.getItem('cookieSeen') != 'shown'){
    $(".cookie-banner").delay(2000).fadeIn();
  }
  $('#accept-cookies').on('click', function(e) {
    localStorage.setItem('cookieConsent','accepted')
    localStorage.setItem('cookieSeen','shown')
    $('.cookie-banner').fadeOut();
  });
  $('#decline-cookies').on('click', function(e) {
    localStorage.setItem('cookieConsent','declined')
    localStorage.setItem('cookieSeen','shown')
    $('.cookie-banner').fadeOut();
  });
});