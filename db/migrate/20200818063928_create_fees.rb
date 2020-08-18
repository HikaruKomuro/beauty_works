class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.references :shop
      t.string :name
      t.string :pay

      t.timestamps
    end
  end
end
