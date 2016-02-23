class AddDueDateToBills < ActiveRecord::Migration
  def change
    add_column :bills, :due_date, :datetime
  end
end
