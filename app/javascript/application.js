// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import $ from "jquery"
// window.jQuery = jquery
// window.$ = jquery
import 'controllers'
import * as bootstrap from "bootstrap"
import "@nathanvda/cocoon"
import "@fortawesome/fontawesome-free"
import "chartkick"
import "Chart.bundle"

// updates the search term in the url when searching with turbo frame in mediline
document.addEventListener("turbo:submit-end", function (event) {
  event.preventDefault();

  const form = event.target;
  const frameId = form.getAttribute("data-turbo-frame");
  const searchInput = form.querySelector("[name='mediline_search']");
  const searchValue = searchInput.value;

  // Update the URL with the search term
  const url = new URL(window.location.href);
  url.searchParams.set("mediline_search", searchValue);
  window.history.pushState({}, "", url.toString());

  // Clear the "No results found" message in the mediline-results-frame
  const resultsFrame = document.querySelector("#mediline-results-frame");
  resultsFrame.innerHTML = "";
});

$(document).on('turbo:load', function() {
  // resizes the navbar logo and brand when scrolling down 80px from top
  if (window.innerWidth >= 768){
    window.onscroll = function() {
      scrollFunction()
    };
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