# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.4/dist/jquery.js"
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.2.1/dist/chart.js"
pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.2/dist/color.esm.js"
pin "chartkick", to: "https://ga.jspm.io/npm:chartkick@5.0.1/dist/chartkick.esm.js"
pin "highcharts", to: "https://ga.jspm.io/npm:highcharts@10.3.3/highcharts.js"
pin "materialize-css", to: "https://ga.jspm.io/npm:materialize-css@1.0.0/dist/js/materialize.js"
pin "popper.js", to: "https://ga.jspm.io/npm:popper.js@1.16.1/dist/umd/popper.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.4-3/app/assets/javascripts/actioncable.esm.js"
pin "@rails/activestorage", to: "https://ga.jspm.io/npm:@rails/activestorage@7.0.4-3/app/assets/javascripts/activestorage.esm.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.4-3/lib/assets/compiled/rails-ujs.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.7/lib/index.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.3/dist/js/bootstrap.esm.js"
