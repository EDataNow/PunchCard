# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.create!(name: "Oshawa", address: "123")
Location.create!(name: "Toronto", address: "456")
Location.create!(name: "Newmarket", address: "789")
Location.create!(name: "Space", address: "000")

<<<<<<< HEAD
User.create!(name: "Joshua", email: "email@email.com", password: "12345678")
User.create!(name: "Spencer", email: "email2@email.com", password: "56789012")
User.create!(name: "Lee", email: "email3@email.com", password: "00000000")
User.create!(name:"Shawn", email: "email4@email.com", password: "22222222")
=======
(1..50).each do |f|
  User.create!(first_name: "User", last_name: "No.#{f}", email: "User#{f}@punchcard.net", password: "password#{f}")
end
>>>>>>> 42b9dacb1f1f0e8c760f953a8fa64746526d8a1c
