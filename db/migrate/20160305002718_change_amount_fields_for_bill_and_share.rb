class ChangeAmountFieldsForBillAndShare < ActiveRecord::Migration
  def change
    rename_column :bills, :total_amount, :total_amount_cents
    rename_column :shares, :share_amount, :share_amount_cents
  end
end
