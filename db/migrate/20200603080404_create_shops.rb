class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.references :owners
      t.string :name
      t.string :tel
      t.boolean :display
      t.string :post_code
      t.string :address_prefecture
      t.string :address_city
      t.string :address_branch
      t.string :building

      t.timestamps
    end
  end
end
