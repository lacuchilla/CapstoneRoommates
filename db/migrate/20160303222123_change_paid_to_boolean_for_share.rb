class ChangePaidToBooleanForShare < ActiveRecord::Migration
  def change
    change_column :shares, :paid, :boolean
  end
end
