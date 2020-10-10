class CreateFreelances < ActiveRecord::Migration[5.1]
  def change
    create_table :freelances do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :line_id
      t.string :password_digest
      t.string :remember_digest
      t.string :post_code
      t.string :address_prefecture
      t.string :address_city
      t.string :address_branch
      t.string :address_building

      t.timestamps
    end
  end
end
