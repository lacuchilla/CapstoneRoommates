class AddHouseholdIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :household_id, :integer
  end
end
