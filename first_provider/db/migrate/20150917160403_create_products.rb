class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :sub_category, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true
      t.string :code
      t.string :name
      t.string :description
      t.integer :stock
      t.integer :minimum_stock
      t.float :price

      t.timestamps null: false
    end
  end
end
