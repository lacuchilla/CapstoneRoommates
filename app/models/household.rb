class Household < ActiveRecord::Base
  has_many :users
  has_many :bills

  validates :name, :address, :move_in_date, presence: true
end
