class Bill < ActiveRecord::Base
  belongs_to :household
  validates :name, :total_amount, :number_of_people_responsible, :names_of_people_responsible, presence: true
  validates :paid, :inclusion => {:in => [true, false]}
end
