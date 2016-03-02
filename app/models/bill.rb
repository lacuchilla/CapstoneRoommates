class Bill < ActiveRecord::Base
  has_many :shares
  belongs_to :household

  validates :name, presence: true
  # :total_amount, :due_date,


end
