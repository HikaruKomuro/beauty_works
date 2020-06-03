class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.string :line_id
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
