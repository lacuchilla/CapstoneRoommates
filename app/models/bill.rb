class Bill < ActiveRecord::Base
  has_many :shares
  belongs_to :household

  validates :name, presence: true
  monetize :total_amount_cents


end
