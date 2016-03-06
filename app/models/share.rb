class Share < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill

  validates :share_amount_cents, presence: true

  monetize :share_amount_cents
end
