class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :area
      t.string :line
      t.string :name
      
    end
  end
end
