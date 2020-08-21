class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.references :shop
      t.string :name
      t.string :pay # 無料ならnil,有料なら量と料金を入力
      t.string :
      t.timestamps
    end
  end
end
