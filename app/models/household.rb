class Household < ActiveRecord::Base
  has_many :bills
  has_many :users

  validates :name, :address, :move_in_date, presence: true
end
