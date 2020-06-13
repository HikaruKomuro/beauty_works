class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.references :freelances
      t.integer :shop_id
      t.string :status
      t.string :reservation：datetime

      t.timestamps
    end
  end
end
