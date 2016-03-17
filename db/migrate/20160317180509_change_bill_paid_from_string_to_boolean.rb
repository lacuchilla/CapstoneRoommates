class ChangeBillPaidFromStringToBoolean < ActiveRecord::Migration
  def change
    # change_column :bills, :paid, 'boolean USING CAST(paid AS boolean)'
    change_column :bills, :paid, :boolean
  end
end
