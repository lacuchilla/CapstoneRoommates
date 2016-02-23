FactoryGirl.define do
  factory :bill do
    name "MyString"
    total_amount 1
    number_of_people_responsible 1
    names_of_people_responsible "MyString"
    paid false
    due_date Time.now
  end
end
