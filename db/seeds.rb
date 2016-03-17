# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first_name: "Baby", last_name: "Rempel", email: "User1@punchcard.net", password: "password1", admin: true)
User.create!(first_name: "Mike", last_name: "Tyson", email: "m.tyson@punchcard.net", password: "boxeradmin", admin: true)
User.create!(first_name: "Brody", last_name: "Bradtke", email: "User3@punchcard.net", password: "password3", admin: false)

Location.create!(name: "Oshawa", address: "123")
Location.create!(name: "Toronto", address: "456")
Location.create!(name: "Newmarket", address: "789")
Location.create!(name: "Space", address: "000")

Location.all.each do |l|
  (1..3).each {|w| Workplace.create!(location_id: l.id, user_id: w)}
  Shift.create!(location_id: l.id)
end

(4..50).each do |f|
  @last_name = Faker::Name.last_name
  User.create!(first_name: Faker::Name.first_name, last_name: @last_name, email: "#{@last_name}#{f}@punchcard.net", password: "password#{f}", admin: false)
  Assignment.create!(user_id: f, shift_id: ((f%3)+1)) if f.even?
  (1..3).each do |w|
    Workplace.create!(location_id: w, user_id: f)
  end
end

