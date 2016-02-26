class DeleteUserIdandBillIdFromHousehold < ActiveRecord::Migration
  def change
    remove_column :households, :user_id, :integer
    remove_column :households, :bill_id, :integer
  end
end
