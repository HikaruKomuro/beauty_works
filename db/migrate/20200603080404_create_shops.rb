class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.references :owners
      t.string :name
      t.string :tel
      t.boolean :display
      t.integer :postcode
      t.integer :preficture_code
      t.string :address_city
      t.string :address_street
      t.string :building

      t.timestamps
    end
  end
end
