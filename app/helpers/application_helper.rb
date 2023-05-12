# frozen_string_literal: true

module ApplicationHelper
  def nav_links
    if user_signed_in?
      link_to 'Logout', destroy_user_session_path, data: { turbo_method: :delete }
    else
      link_to 'Login', new_user_session_path
    end
  end

  def basic_options(unit)
    {
      adapter: 'highcharts',
      legend: false,
      colors: ['#f5b82e'],
      messages: { empty: 'No data' },
      library: {
        yAxis: {
          title: {
            text: 'Unit'
          }
        },
        xAxis: {
          title: {
            text: unit
          }
        },
        plotOptions: {
          line: {
            color: '#f5b82e'
          }
        }
      }
    }
  end
end
