class CreateOccupations < ActiveRecord::Migration[5.1]
  def change
    create_table :occupations do |t|
      t.references :shop
      t.references :freelance
      
      t.string :name
      t.string :ja
      t.timestamps
    end
  end
end
