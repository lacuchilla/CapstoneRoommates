class Bill < ActiveRecord::Base
  has_many :child_key, class_name: "Bill", foreign_key: 'parent_id'
  belongs_to :parent_key, class_name: "Category", foreign_key: 'parent_id'
  validates :name, :total_amount, :number_of_people_responsible, :names_of_people_responsible, presence: true
  validates :paid, :inclusion => {:in => [true, false]}
end
