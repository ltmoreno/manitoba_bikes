# Delete tables before seeding
AdminUser.delete_all

AdminUser.create!(email: 'admin@manitobabikes.com', password: 'opAu66m6qEJCo9sJW94s', password_confirmation: 'opAu66m6qEJCo9sJW94s') if Rails.env.development?