class CreateAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :accesses do |t|
      t.references :shops
      t.string :line
      t.string :station
      t.integer :walk_time
      t.integer :bus_time
      t.integer :bus_stop

      t.timestamps
    end
  end
end
