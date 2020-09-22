class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.references :shop
      t.string :plan
      t.string :pay
      t.boolean :apply
      
      t.timestamps
    end
  end
end
