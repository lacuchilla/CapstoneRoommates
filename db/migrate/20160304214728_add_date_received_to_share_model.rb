class AddDateReceivedToShareModel < ActiveRecord::Migration
  def change
    add_column :shares, :date_received, :datetime
  end
end
