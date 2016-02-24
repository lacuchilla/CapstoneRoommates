class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :name
      t.string :address
      t.datetime :move_in_date

      t.timestamps null: false
    end
  end
end
