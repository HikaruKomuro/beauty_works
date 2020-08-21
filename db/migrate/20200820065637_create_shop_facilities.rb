class CreateShopFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_facilities do |t|
      t.references :shop, foreign_key: true
      t.references :facility, foreign_key: true

      t.timestamps
    end
  end
end
