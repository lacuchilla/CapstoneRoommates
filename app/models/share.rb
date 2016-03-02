class Share < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill

  # validates :share_amount, presence: true
end
