class Bill < ActiveRecord::Base
  has_many :shares
  belongs_to :household

  validates :name, presence: true
  monetize :total_amount_cents

  enum bill_status: [:created_no_shares, :created_unpaid_shares, :created_all_shares_paid, :bill_paid]


end
