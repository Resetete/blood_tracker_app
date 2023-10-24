# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin 'jquery', to: 'https://ga.jspm.io/npm:jquery@3.6.4/dist/jquery.js'
pin '@popperjs/core', to: 'https://ga.jspm.io/npm:@popperjs/core@2.11.2/lib/index.js'
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.4.0/dist/chart.js"
pin "chart.js/helpers", to: "https://ga.jspm.io/npm:chart.js@4.4.0/helpers/helpers.js"
pin "chartjs-adapter-date-fns", to: "https://ga.jspm.io/npm:chartjs-adapter-date-fns@3.0.0/dist/chartjs-adapter-date-fns.esm.js"
pin '@kurkle/color', to: 'https://ga.jspm.io/npm:@kurkle/color@0.3.2/dist/color.esm.js'
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "chartjs-plugin-annotation", to: "vendor/javascript/chartjs-plugin-annotation.js"
pin 'highcharts', to: 'https://ga.jspm.io/npm:highcharts@10.3.3/highcharts.js'
pin '@rails/actioncable', to: 'https://ga.jspm.io/npm:@rails/actioncable@7.0.4-3/app/assets/javascripts/actioncable.esm.js'
pin '@rails/activestorage', to: 'https://ga.jspm.io/npm:@rails/activestorage@7.0.4-3/app/assets/javascripts/activestorage.esm.js'
pin '@rails/ujs', to: 'https://ga.jspm.io/npm:@rails/ujs@7.0.4-3/lib/assets/compiled/rails-ujs.js'
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'bootstrap', to: 'https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js'
pin '@nathanvda/cocoon', to: 'https://ga.jspm.io/npm:@nathanvda/cocoon@1.2.14/cocoon.js'
pin "@fortawesome/fontawesome-free", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.1.1/js/all.js"
pin "choices.js", to: "https://ga.jspm.io/npm:choices.js@10.2.0/public/assets/scripts/choices.js"
