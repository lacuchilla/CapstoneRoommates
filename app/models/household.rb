class Household < ActiveRecord::Base
  has_many :users
  has_many :bills

  validates :name, :address, presence: true
end
