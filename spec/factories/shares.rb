FactoryBot.define do
  factory :share do
    bill_id { 1 }
    due_date { "2016-02-23 16:09:13" }
    share_amount_cents { 1 }
    paid { false }
  end
end
