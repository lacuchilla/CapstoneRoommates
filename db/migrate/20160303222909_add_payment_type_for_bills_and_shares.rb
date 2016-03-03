class AddPaymentTypeForBillsAndShares < ActiveRecord::Migration
  def change
    add_column :bills, :payment_type, :string
    add_column :shares, :payment_type, :string
  end
end
