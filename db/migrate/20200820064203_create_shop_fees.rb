class CreateShopFees < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_fees do |t|
      
      t.references :shop, foreign_key: true
      t.references :fee, foreign_key: true
      
      t.timestamps
    end
  end
end
