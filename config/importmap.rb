# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js", preload: true

pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js/dist/chart.min.js", preload: true
pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.2/dist/color.esm.js", preload: true
