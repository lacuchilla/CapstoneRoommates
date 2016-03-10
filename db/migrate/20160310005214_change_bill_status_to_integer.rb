class ChangeBillStatusToInteger < ActiveRecord::Migration
  def change
      change_column :bills, :bill_status, :integer
  end
end
