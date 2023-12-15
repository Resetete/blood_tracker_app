# frozen_string_literal: true

# Create an admin user it it doesn't exist

if User.find_by(username: Rails.application.credentials.admin.username.downcase)
  Rails.logger.debug 'Admin user already exists'
else
  user = User.new(
    username: Rails.application.credentials.admin.username,
    password: Rails.application.credentials.admin.password,
    password_confirmation: Rails.application.credentials.admin.password,
    admin: true
  )
  begin
    Rails.logger.debug 'Admin user created' if user.save
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.debug "Admin could not be created due to #{e}"
  end
end
