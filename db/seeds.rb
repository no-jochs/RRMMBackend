# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development? || ENV['PIPELINE_STAGE'] == 'staging'
  User.create(email: 'admin@example.com', password: 'passwordpassword', password_confirmation: 'passwordpassword',
              name: 'Some Admin')
  FactoryBot.create_list(:meeting, 50)
end
