class AddMoveInDateToUserModel < ActiveRecord::Migration
  def change
    add_column :users, :move_in_date, :datetime
  end
end
