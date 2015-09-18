class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :secret_token
      t.boolean :enable

      t.timestamps null: false
    end
  end
end
