# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(email: "test@test.com", first_name: "test", last_name: "test", password: "test", password_confirmation: "test", quirk: Faker::Company.catch_phrase)

20.times do 
  first_name = Faker::Name.first_name
  User.create!(email: first_name + "@test.com", first_name: first_name, last_name: Faker::Name.last_name, password: "test", password_confirmation: "test", quirk: Faker::Company.catch_phrase)
end