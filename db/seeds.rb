# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.create!(name: "Oshawa", address: "123")
Shift.create!(location_id: 1)

Location.create!(name: "Toronto", address: "456")
Shift.create!(location_id: 2)

Location.create!(name: "Newmarket", address: "789")
Shift.create!(location_id: 3)

Location.create!(name: "Space", address: "000")

User.create!(first_name: "User", last_name: "No.1", email: "User1@punchcard.net", password: "password1", admin: true)

(2..50).each do |f|
  User.create!(first_name: "User", last_name: "No.#{f}", email: "User#{f}@punchcard.net", password: "password#{f}", admin: false)
  Assignment.create!(user_id: f, shift_id: ((f%3)+1)) if f.even?
  (1..3).each do |w|
    Workplace.create!(location_id: w, user_id: f)
  end
end

