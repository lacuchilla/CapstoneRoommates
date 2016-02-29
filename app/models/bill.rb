class Bill < ActiveRecord::Base
  has_many :shares, dependent: :destroy
  belongs_to :household

  validates :name, :total_amount, presence: true
  validates :paid, :inclusion => {:in => [true, false]}
end
