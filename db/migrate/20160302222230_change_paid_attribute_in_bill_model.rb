class ChangePaidAttributeInBillModel < ActiveRecord::Migration
  def change
    change_column :bills, :paid, :string
  end
end
