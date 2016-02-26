class AddUserIdandBillIdToHousehold < ActiveRecord::Migration
  def change
    add_column :households, :user_id, :integer
    add_column :households, :bill_id, :integer
  end
end
