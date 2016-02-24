# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_bills = [
  {name: "April Rent", total_amount: 50000, number_of_people_responsible: 3, names_of_people_responsible: "Waddle Dee, Waddle Doo, Metaknight"}
]

seed_bills.each do |bill|
  Bill.create(bill)
end

seed_users = [
  {}
]

seed_users.each do |user|
  User.create(user)
end
