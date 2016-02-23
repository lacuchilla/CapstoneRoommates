class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.integer :total_amount
      t.integer :number_of_people_responsible
      t.string :names_of_people_responsible
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
