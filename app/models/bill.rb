class Bill < ActiveRecord::Base
  validates :name, :total_amount, :number_of_people_responsible, :names_of_people_responsible, presence: true
end
