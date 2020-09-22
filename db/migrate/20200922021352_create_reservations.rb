class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :freelance, foreign_key: true
      t.references :shop, foreign_key: true
      t.datetime :preferred_date1
      t.datetime :preferred_date2
      t.datetime :preferred_date3
      t.datetime :fixed_date

      t.timestamps
    end
  end
end
