class RemoveUnnecessaryColumnsFromBill < ActiveRecord::Migration
  def change
    remove_column :bills, :number_of_people_responsible, :integer
    remove_column :bills, :names_of_people_responsible, :string
    remove_column :bills, :parent_key, :integer
    remove_column :bills, :child_key, :integer
  end
end
