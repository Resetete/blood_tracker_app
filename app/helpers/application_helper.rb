# frozen_string_literal: true

module ApplicationHelper
  def nav_links
    if user_signed_in?
      link_to 'Logout', destroy_user_session_path, data: { turbo_method: :delete }
    else
      link_to 'Login', new_user_session_path
    end
  end

  def render_turbo_stream_flash_messages
    turbo_stream.prepend 'flash', partial: 'layouts/flash_messages'
  end
end
