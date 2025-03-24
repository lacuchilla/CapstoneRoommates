FactoryBot.define do
  factory :bill do
    name { "MyString" }
    total_amount_cents { 1 }
    paid { false }
    due_date { Time.now }
    household_id { 1 }
  end
end
