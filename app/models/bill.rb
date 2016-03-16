class Bill < ActiveRecord::Base
  has_many :shares
  belongs_to :household

  # validates :name, :total_amount_cents, :paid, :due_date, presence: true
  monetize :total_amount_cents
  after_save :amount_remaining_cents
  monetize :amount_remaining_cents
  before_save :set_status
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

  def check_bill_status
    set_status
  end

  def set_status
    if self.shares.none? && self.paid == "f"
      self.bill_status = 0
      "created"
    elsif self.shares.any? { |s| s.paid == false }
      self.bill_status = 1
      "created_unpaid_shares"
    elsif self.shares.all? { |s| s.paid == true } && self.paid == "f"
      self.bill_status = 2
      "created_all_shares_paid"
    elsif self.shares.all? { |s| s.paid == true } && self.paid == "t"
      self.bill_status = 3
      "bill_paid"

    else
      "I don't know what status this is"
    end
  end
end
