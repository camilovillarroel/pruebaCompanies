# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.destroy_all
User.destroy_all
Company.destroy_all
Complaint.destroy_all


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?



30.times do |i|
    User.create(
    email: "somemail#{i}@mailcl",
    password: '123456',
    password_confirmation: '123456'
    )
end

20.times do |i|
    Company.create(
    name: Faker::Name.name
    )
end

250.times do |i|
    Complaint.create(
    content: Faker::Lorem.paragraph,
    user: User.order("RANDOM()").first,
    company: Company.order("RANDOM()").first
    )
end