class Bill < ActiveRecord::Base
  has_many :shares
  belongs_to :household

  validates :name, :total_amount_cents, :paid, :due_date, presence: true
  monetize :total_amount_cents
  after_save :amount_remaining_cents
  monetize :amount_remaining_cents

  enum bill_status: [:created, :created_unpaid_shares, :created_all_shares_paid, :bill_paid]

  def amount_remaining_cents
    amounts = self.shares
    total_amount_of_shares = 0
    amounts.each do |a|
      total_amount_of_shares += a.share_amount_cents
    end
    amount = self.total_amount_cents - total_amount_of_shares
    return amount
  end
end
