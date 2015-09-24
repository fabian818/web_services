class CreateMyActions < ActiveRecord::Migration
  def change
    create_table :my_actions do |t|
      t.string :name
      t.string :url
      t.boolean :active
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
