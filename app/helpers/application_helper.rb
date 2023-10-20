# frozen_string_literal: true

module ApplicationHelper
  def nav_links
    if user_signed_in?
      link_to 'Logout', destroy_user_session_path, data: { turbo_method: :delete }
    else
      link_to 'Login', new_user_session_path
    end
  end

  def graph_annotations(min, max)
    {
      plugins: {
        annotation: {
          annotations: {
            # ymax and ymin should be an attribute of parameter
            line1: { type: 'line', yMin: min, yMax: min, borderColor: 'green', borderWidth: 2 },
            line2: { type: 'line', yMin: max, yMax: max, borderColor: 'orange', borderWidth: 2 }
          }
        }
      }
    }
  end
end
