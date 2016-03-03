class ChangePaidTypeToStringForShareModel < ActiveRecord::Migration
  def change
    change_column :shares, :paid, :string
  end
end
