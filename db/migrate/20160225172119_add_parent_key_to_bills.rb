class AddParentKeyToBills < ActiveRecord::Migration
  def change
    add_column :bills, :parent_key, :integer
  end
end
