# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first_name: "Mike", last_name: "Tyson", email: "m.tyson@punchcard.net", password: "boxeradmin", admin: true)

Location.create!(name: "Oshawa", address: "123")
Location.create!(name: "Toronto", address: "456")
Location.create!(name: "Newmarket", address: "789")
Location.create!(name: "Space", address: "000")

Location.all.each do |l|
  Workplace.create!(location_id: l.id, user_id: 1)
  Shift.create!(location_id: l.id)
end

(2..50).each do |f|
  User.create!(first_name: "User", last_name: "No.#{f}", email: "User#{f}@punchcard.net", password: "password#{f}", admin: false)
  Assignment.create!(user_id: f, shift_id: ((f%3)+1)) if f.even?
  (1..3).each do |w|
    Workplace.create!(location_id: w, user_id: f)
  end
end

