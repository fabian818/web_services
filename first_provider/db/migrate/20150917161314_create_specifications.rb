class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.references :product, index: true, foreign_key: true
      t.string :memory_size
      t.string :processor
      t.string :hard_disk
      t.string :ram
      t.string :os
      t.string :antivirus
      t.string :socket
      t.string :form_factor
      t.string :screen_size
      t.string :zoom_level
      t.string :increase
      t.string :type
      t.string :capacity

      t.timestamps null: false
    end
  end
end
