class CreateShopOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_options do |t|
      t.references :shop, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
