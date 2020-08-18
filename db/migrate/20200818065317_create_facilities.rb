class CreateFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :facilities do |t|
      t.references :shop
      t.string :name

      t.timestamps
    end
  end
end
