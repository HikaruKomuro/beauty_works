class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :line_id

      t.timestamps
    end
  end
end
