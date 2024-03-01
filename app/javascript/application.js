// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import $ from "jquery"
// window.jQuery = jQuery
// window.jquery = jquery
// window.$ = jquery
import 'controllers'
import * as bootstrap from "bootstrap"
import "@nathanvda/cocoon"
import "@fortawesome/fontawesome-free"
import "chartkick"
import "Chart.bundle"
import Choices from 'choices.js';
import { Chart, registerables } from "chart.js"
Chart.register(...registerables)
import 'chartjs-plugin-annotation';

// animation on landing page
function initializeAnimation() {
  var canvas, ctx, mouse, gravityStrength, particles, spawnTimer, spawnInterval, type, time, particleOverflow, x, y, a;

  window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;

  var init = function () {
    canvas = document.getElementById('landingpage-animation');
    ctx = canvas.getContext('2d');

    var onresize = function () {
      canvas.width = canvas.clientWidth;
      canvas.height = canvas.clientHeight;
    };
    onresize();

    mouse = { x: canvas.width / 2, y: canvas.height / 2, out: false };

    canvas.onmouseout = function () {
      mouse.out = true;
    };

    canvas.onmousemove = function (e) {
      var rect = canvas.getBoundingClientRect();
      mouse = {
        x: e.clientX - rect.left,
        y: e.clientY - rect.top,
        out: false
      };
    };

    gravityStrength = 10;
    particles = [];
    spawnTimer = 0;
    spawnInterval = 30; // speed of the bubble creation
    type = 0;
    requestAnimationFrame(startLoop);
  };

  var newParticle = function () {
    type = type ? 0 : 1;
    particles.push({
      x: mouse.x,
      y: mouse.y,
      xv: type ? 18 * Math.random() - 9 : 24 * Math.random() - 12,
      yv: type ? 18 * Math.random() - 9 : 24 * Math.random() - 12,
      c: type ? 'rgb(255,' + ((200 * Math.random()) | 0) + ',' + ((80 * Math.random()) | 0) + ')' : 'rgb(255,255,255)',
      s: type ? 5 + 10 * Math.random() : 1,
      a: 1
    });
  };

  var startLoop = function (newTime) {
    time = newTime;
    requestAnimationFrame(loop);
  };

  var loop = function (newTime) {
    draw();
    calculate(newTime);
    requestAnimationFrame(loop);
  };

  var draw = function () {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    for (var i = 0; i < particles.length; i++) {
      var p = particles[i];
      ctx.globalAlpha = p.a;
      ctx.fillStyle = p.c;
      ctx.beginPath();
      ctx.arc(p.x, p.y, p.s, 0, 2 * Math.PI);
      ctx.fill();
    }
  };

  var calculate = function (newTime) {
    var dt = newTime - time;
    time = newTime;

    if (!mouse.out) {
      spawnTimer += dt < 100 ? dt : 100;
      for (; spawnTimer > 0; spawnTimer -= spawnInterval) {
        newParticle();
      }
    }

    particleOverflow = particles.length - 700;
    if (particleOverflow > 0) {
      particles.splice(0, particleOverflow);
    }

    for (var i = 0; i < particles.length; i++) {
      var p = particles[i];
      if (!mouse.out) {
        x = mouse.x - p.x;
        y = mouse.y - p.y;
        a = x * x + y * y;
        a = a > 100 ? gravityStrength / a : gravityStrength / 100;
        p.xv = (p.xv + a * x) * 0.99;
        p.yv = (p.yv + a * y) * 0.99;
      }
      p.x += p.xv;
      p.y += p.yv;
      p.a *= 0.99;
    }
  };

  var onload = function () {
    setTimeout(init, 0);
  };

  // Initial setup
  onload();
};

// updates the search term in the url when searching with turbo frame in mediline
document.addEventListener("turbo:submit-end", function (event) {
  event.preventDefault();

  const form = event.target;
  const frameId = form.getAttribute("data-turbo-frame");
  const searchInput = form.querySelector("[name='mediline_search']");
  const searchValue = searchInput?.value;

  // Update the URL with the search term
  const url = new URL(window.location.href);
  url.searchParams.set("mediline_search", searchValue);
  window.history.pushState({}, "", url.toString());

  // Clear the "No results found" message in the mediline-results-frame
  const resultsFrame = document.querySelector("#mediline-results-frame");
  if (resultsFrame) {
    resultsFrame.innerHTML = "";
  }
});

$(document).on('turbo:load', function() {
  const frame = document.getElementById('new_hemigram');
  if (frame) {
    frame.addEventListener('change', function(event) {
      // Dropdown in hemigram form
      let selectElement = document.getElementById('parameter-select');
      // Check if Choices has already been initialized on the element
      if (!selectElement.classList.contains('choices-initialized')) {
        new Choices(selectElement, { searchEnabled: true, allowHTML: true });
        // Add a class to mark the element as initialized
        selectElement.classList.add('choices-initialized');
      }

      // Return hemigram parameter unit options for dropdown in hemigram form
      // Change abbreviation/shorts field if parameter dropdown is filled
      var selectedOption = $('#parameter-select').val();
      updateUnitDropdown(selectedOption)

      // Change abbreviation/shorts field if parameter changes
      $('#parameter-select').off('change').on('change', function() {
        var selectedOption = $(this).val();
        updateUnitDropdown(selectedOption)
      });

      function updateUnitDropdown(selectedOption) {
        $.ajax({
          url: '/hemigrams/get_unit_selection_dropdown_options',
          data: { 'parameter_select': selectedOption },
          dataType: 'json',
          success: function (data) {
            var unitDropdown = $('#hemigram_unit');
            unitDropdown.empty(); // Clear existing options
            var inputAbbreviation = $('#input_abreviation');

            if (data.shorts == undefined || data.options == null) {
              unitDropdown.append(new Option('Select a parameter first', ''));
              inputAbbreviation.val('Select a parameter first');
            } else {
              // Update the abbreviation values if the parameter changes
              var shortValue = data.shorts;
              inputAbbreviation.val(shortValue);

              if (data.options && data.options.length > 0) {
                data.options.forEach(function (option) {
                  unitDropdown.append(new Option(option, option));
                });
              } else {
                unitDropdown.append(new Option('Select unit', ''));
              }
            }
          },
        });
      }
    });
  }

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

  if (document.getElementById('landingpage-animation')) {
    initializeAnimation();
  };
});
