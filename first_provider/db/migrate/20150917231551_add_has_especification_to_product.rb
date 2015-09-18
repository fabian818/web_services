class AddHasEspecificationToProduct < ActiveRecord::Migration
  def change
    add_column :products, :has_especification, :boolean
  end
end
