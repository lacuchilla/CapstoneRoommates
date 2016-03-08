# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_bills = [
  {name: "April Rent", total_amount: 3000.99, due_date: "2016-04-01 00:00:00", household_id: 1, paid: false, bill_status: 1},
  {name: "May Rent", total_amount: 3000, due_date: "2016-05-01 00:00:00", household_id: 1, paid: false, bill_status: 1},
  {name: "June Rent", total_amount: 3000, due_date: "2016-06-01 00:00:00", household_id: 1, paid: false, bill_status: 1},
  {name: "July Rent", total_amount: 3000, due_date: "2016-07-01 00:00:00", household_id: 1, paid: false, bill_status: 1},
  {name: "August Rent", total_amount: 3000, due_date: "2016-08-01 00:00:00", household_id: 1, paid: false, bill_status: 1},
  {name: "Febtober Rent", total_amount: 3000, due_date: "2016-08-01 00:00:00", household_id: 1, paid: false, bill_status: 1},
  {name: "Januly Rent", total_amount: 3000, due_date: "2016-08-01 00:00:00", household_id: 1, paid: false, bill_status: 2}
]

seed_bills.each do |bill|
  Bill.create(bill)
end

seed_shares = [
  {bill_id: 1, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 1},
  {bill_id: 1, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-03-24 00:00:00", user_id: 2},
  {bill_id: 1, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 3},
  {bill_id: 1, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: true, payment_type: "cash", date_received: "2016-03-20 00:00:00", user_id: 4},
  {bill_id: 1, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 5},
  {bill_id: 2, due_date: "2016-04-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 1},
  {bill_id: 2, due_date: "2016-04-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-04-24 00:00:00", user_id: 2},
  {bill_id: 2, due_date: "2016-04-25 00:00:00", share_amount: 600, paid: false, payment_type:  nil, date_received: nil, user_id: 3},
  {bill_id: 2, due_date: "2016-04-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-04-23 00:00:00", user_id: 4},
  {bill_id: 2, due_date: "2016-04-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 5},
  {bill_id: 3, due_date: "2016-05-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-05-22 00:00:00", user_id: 1},
  {bill_id: 3, due_date: "2016-05-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 2},
  {bill_id: 3, due_date: "2016-05-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 3},
  {bill_id: 3, due_date: "2016-05-25 00:00:00", share_amount: 600, paid: true, payment_type: "cash", date_received: "2016-05-24 00:00:00", user_id: 4},
  {bill_id: 3, due_date: "2016-05-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 5},
  {bill_id: 4, due_date: "2016-06-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 1},
  {bill_id: 4, due_date: "2016-06-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 2},
  {bill_id: 4, due_date: "2016-06-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 3},
  {bill_id: 4, due_date: "2016-06-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 4},
  {bill_id: 4, due_date: "2016-06-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 5},
  {bill_id: 5, due_date: "2016-07-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-07-24 00:00:00", user_id: 1},
  {bill_id: 5, due_date: "2016-07-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-07-22 00:00:00", user_id: 2},
  {bill_id: 5, due_date: "2016-07-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-07-24 00:00:00", user_id: 3},
  {bill_id: 5, due_date: "2016-07-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-07-23 00:00:00", user_id: 4},
  {bill_id: 5, due_date: "2016-07-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-07-24 00:00:00", user_id: 5}
]

seed_shares.each do |share|
  Share.create(share)
end

seed_users = [
  {username: "Kirby01", email: nil, uid: "675074073", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47472755008670...", household_id: 1},
  {username: "KingDedede", email: nil, uid: "675088073", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47473335008670...", household_id: 1 },
  {username: "WaddleDoooooo", email: nil, uid: "679994073", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47489855008670...", household_id: 1},
  {username: "Metaknight007", email: nil, uid: "675074665", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47333755008670...", household_id: 1},
  {username: "WaddleDeeeeee", email: nil, uid: "675555073", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47472755099970...", household_id: 1}
]

seed_users.each do |user|
  User.create(user)
end

seed_households = [
  {name: "The Phoenix Foundation", address: "123 Fake Street", move_in_date: "2014-02-24 20:52:51"}
]

seed_households.each do |household|
  Household.create(household)
end
