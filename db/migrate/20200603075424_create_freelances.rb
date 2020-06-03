class CreateFreelances < ActiveRecord::Migration[5.1]
  def change
    create_table :freelances do |t|
      t.string :name
      t.string :email
      t.string :line_id

      t.timestamps
    end
  end
end
