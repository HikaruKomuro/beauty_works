class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.string :line_id
      t.string :tel
      t.string :password_digest
      t.integer :postcode
      t.integer :preficture_code
      t.string :address_city
      t.string :address_street
      t.string :building
      

      t.timestamps
    end
  end
end
