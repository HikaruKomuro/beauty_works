class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.references :shop
      t.string :name
      t.string :email
      t.string :line_id
      t.string :phone_number

      t.timestamps
    end
  end
end
