class CreateShopOccupations < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_occupations do |t|
      t.references :shop, foreign_key: true
      t.references :occupation, foreign_key: true

      t.timestamps
    end
  end
end
