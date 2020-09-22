class CreateFreelanceOccupations < ActiveRecord::Migration[5.1]
  def change
    create_table :freelance_occupations do |t|
      t.references :freelance, foreign_key: true
      t.references :occupation, foreign_key: true

      t.timestamps
    end
  end
end
