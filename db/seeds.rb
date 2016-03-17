# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_bills = [
  {name: "October 2015 Rent", total_amount: 3000.99, due_date: "2015-10-01 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "November 2015 Rent", total_amount: 3000, due_date: "2015-11-01 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "December 2015 Rent", total_amount: 3000, due_date: "2015-12-01 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "January 2016 Rent", total_amount: 3000, due_date: "2016-01-01 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "February 2016 Rent", total_amount: 3000, due_date: "2016-02-01 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "March 2016 Rent", total_amount: 3000, due_date: "2016-03-01 00:00:00", household_id: 1, paid: false, bill_status: 3},
  {name: "April 2016 Rent", total_amount: 3000, due_date: "2016-04-01 00:00:00", household_id: 1, paid: true, bill_status: 1},
  {name: "January 2016 PSE", total_amount: 104.49, due_date: "2016-01-10 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "January 2016 Internet", total_amount: 75.50, due_date: "2016-01-10 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "December 2015 PSE", total_amount: 92.25, due_date: "2016-12-10 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "December 2015 Seattle City Light", total_amount: 69.02, due_date: "2016-12-10 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "December 2015 Utilities", total_amount: 534.45, due_date: "2016-12-10 00:00:00", household_id: 1, paid: true, bill_status: 3},
  {name: "December 2015 House Supplies", total_amount: 23.33, due_date: "2016-12-10 00:00:00", household_id: 1, paid: true, bill_status: 3},
]

seed_bills.each do |bill|
  Bill.create(bill)
end

seed_shares = [
  {bill_id: 1, due_date: "2016-09-25 00:00:00", share_amount: 600, paid: true, payment_type: "cash", date_received: "2016-09-24 00:00:00", user_id: 1},
  {bill_id: 1, due_date: "2016-09-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-09-24 00:00:00", user_id: 2},
  {bill_id: 1, due_date: "2016-09-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-09-24 00:00:00", user_id: 3},
  {bill_id: 1, due_date: "2016-09-25 00:00:00", share_amount: 600, paid: true, payment_type: "cash", date_received: "2016-09-20 00:00:00", user_id: 4},
  {bill_id: 1, due_date: "2016-09-25 00:00:00", share_amount: 600, paid: true, payment_type: "cash", date_received: "2016-09-25 00:00:00", user_id: 5},
  {bill_id: 2, due_date: "2016-10-25 00:00:00", share_amount: 600, paid: true, payment_type: "cash", date_received: "2016-10-24 00:00:00", user_id: 1},
  {bill_id: 2, due_date: "2016-10-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-10-24 00:00:00", user_id: 2},
  {bill_id: 2, due_date: "2016-10-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-10-24 00:00:00", user_id: 3},
  {bill_id: 2, due_date: "2016-10-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-10-23 00:00:00", user_id: 4},
  {bill_id: 2, due_date: "2016-10-25 00:00:00", share_amount: 600, paid: true, payment_type: "cash", date_received: "2016-10-24 00:00:00", user_id: 5},
  {bill_id: 3, due_date: "2016-11-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-11-22 00:00:00", user_id: 1},
  {bill_id: 3, due_date: "2016-11-25 00:00:00", share_amount: 600, paid: true, payment_type: "cash", date_received: "2016-11-22 00:00:00", user_id: 2},
  {bill_id: 3, due_date: "2016-11-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-11-25 00:00:00", user_id: 3},
  {bill_id: 3, due_date: "2016-11-25 00:00:00", share_amount: 600, paid: true, payment_type: "cash", date_received: "2016-11-19 00:00:00", user_id: 4},
  {bill_id: 3, due_date: "2016-11-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-11-25 00:00:00", user_id: 5},
  {bill_id: 4, due_date: "2016-12-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-12-19 00:00:00", user_id: 1},
  {bill_id: 4, due_date: "2016-12-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-12-24 00:00:00", user_id: 2},
  {bill_id: 4, due_date: "2016-12-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-12-23 00:00:00", user_id: 3},
  {bill_id: 4, due_date: "2016-12-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-12-25 00:00:00", user_id: 4},
  {bill_id: 4, due_date: "2016-12-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-12-19 00:00:00", user_id: 5},
  {bill_id: 5, due_date: "2016-01-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-01-24 00:00:00", user_id: 1},
  {bill_id: 5, due_date: "2016-01-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-01-22 00:00:00", user_id: 2},
  {bill_id: 5, due_date: "2016-01-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-01-24 00:00:00", user_id: 3},
  {bill_id: 5, due_date: "2016-01-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-01-23 00:00:00", user_id: 4},
  {bill_id: 5, due_date: "2016-01-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-01-24 00:00:00", user_id: 5},
  {bill_id: 6, due_date: "2016-02-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-02-24 00:00:00", user_id: 1},
  {bill_id: 6, due_date: "2016-02-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-02-24 00:00:00", user_id: 2},
  {bill_id: 6, due_date: "2016-02-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-02-24 00:00:00", user_id: 3},
  {bill_id: 6, due_date: "2016-02-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-02-24 00:00:00", user_id: 4},
  {bill_id: 6, due_date: "2016-02-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-02-24 00:00:00", user_id: 5},
  {bill_id: 6, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-03-24 00:00:00", user_id: 1},
  {bill_id: 6, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 2},
  {bill_id: 6, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-03-24 00:00:00", user_id: 3},
  {bill_id: 6, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: true, payment_type: "check", date_received: "2016-03-24 00:00:00", user_id: 4},
  {bill_id: 6, due_date: "2016-03-25 00:00:00", share_amount: 600, paid: false, payment_type: nil, date_received: nil, user_id: 5},
]

seed_shares.each do |share|
  Share.create(share)
end

seed_users = [
  {username: "Kirby01", name: "Kirby", email: "amyrhunter@gmail.com", uid: "675074073", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47472755008670...", household_id: 1},
  {username: "KingDedede", name: "King Dedede", email: "amyrhunter@gmail.com", uid: "675088073", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47473335008670...", household_id: 1 },
  {username: "WaddleDoooooo", name: "Waddle Doo", email: "amyrhunter@gmail.com", uid: "679994073", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47489855008670...", household_id: 1},
  {username: "Metaknight007", name: "Metaknight", email: "amyrhunter@gmail.com", uid: "675074665", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47333755008670...", household_id: 1},
  {username: "WaddleDeeeeee", name: "Waddle Dee", email: "amyrhunter@gmail.com", uid: "675555073", provider: "twitter", avatar_url: nil, created_at: "2016-02-24 20:52:51", updated_at: "2016-02-24 20:52:51", image_url: "http://pbs.twimg.com/profile_images/47472755099970...", household_id: 1}
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
