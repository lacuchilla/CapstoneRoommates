class AddBillStatusToBillModel < ActiveRecord::Migration
  def change
    add_column :bills, :bill_status, :integer
  end
end
