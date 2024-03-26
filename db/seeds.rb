# Delete tables before seeding
AdminUser.delete_all

AdminUser.create!(email: ENV['admin_email'], password: ENV['admin_password'], password_confirmation: ENV['admin_password']) if Rails.env.development?