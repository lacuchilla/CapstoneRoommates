class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :bill_id
      t.datetime :due_date
      t.integer :share_amount
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
