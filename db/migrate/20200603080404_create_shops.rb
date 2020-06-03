class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.boolean :display

      t.timestamps
    end
  end
end
