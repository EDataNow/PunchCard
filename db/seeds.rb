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

Shift.create!()

User.create!(first_name: "User", last_name: "No.1", email: "User1@punchcard.net", password: "password1", admin: true)

(2..50).each do |f|
  User.create!(first_name: "User", last_name: "No.#{f}", email: "User#{f}@punchcard.net", password: "password#{f}", admin: false)
  Assignment.create!(user_id: f, shift_id: 1, username: "No.#{f}, User", location: "Oshawa") if f.even?
end

