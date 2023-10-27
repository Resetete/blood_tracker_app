# frozen_string_literal: true

# Options doesn't seem to have any effect
# TODO: remove
Chartkick.options = {
  adapter: 'chartjs',
  options: {
    plugins: {
      annotation: {
        annotations: {
          line1: {
            type: 'line',
            yMin: 5000,
            yMax: 5000,
            borderColor: 'rgb(255, 99, 132)',
            borderWidth: 2
          }
        }
      }
    },
    responsive: true,
    title: {
      display: true,
      text: 'Chart.js Draw Line On Chart'
    },
    tooltips: {
      mode: 'index',
      intersect: true
    }
  }
}
