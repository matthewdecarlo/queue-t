# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

squirrel = Cohort.create!(name: "squirrel", start_date: "2015-01-05")

User.create(email: "test@test.com", first_name: "test", last_name: "test", password: "test", password_confirmation: "test", cohort_id: squirrel.id, role: "administrator")


3.times do 
  username = Faker::Name.first_name
  User.create(email: "#{username}@test.com" , first_name: username, last_name: Faker::Name.last_name, password: "test", password_confirmation: "test", role: "teacher")
end

20.times do 
  username = Faker::Name.first_name
  User.create(email: "#{username}@test.com" , first_name: username, last_name: Faker::Name.last_name, password: "test", password_confirmation: "test", cohort: squirrel, role: "student")
end

# weekly group
# Group.create(name: , type: , begin_date: , end_date: )


# daily group
