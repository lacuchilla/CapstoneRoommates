class AddChildKeyToBills < ActiveRecord::Migration
  def change
    add_column :bills, :child_key, :integer
  end
end
