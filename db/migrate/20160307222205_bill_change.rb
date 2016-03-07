class BillChange < ActiveRecord::Migration
  def change
     change_column :bills, :bill_status, :integer, :default => 0
  end
end
