class CreateFreelanceStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :freelance_statuses do |t|
      t.boolean :eyelist
      t.boolean :hairdresser
      t.boolean :manicurist
      t.integer :belongs

      t.timestamps
    end
  end
end
