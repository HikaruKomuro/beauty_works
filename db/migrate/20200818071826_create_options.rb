class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.references :shop
      t.boolean :salon_facility #　サロン設備
      t.boolean :for_practitioner # 無料施術者オプション
      t.boolean :for_guest # 無料お客様オプション
      t.boolean :paid_option # 有料オプション
      t.boolean :standard # 標準オプション（常時選択可能なもの）
      t.string :name
      t.string :pay # 無料ならnil,有料なら料金を入力
      t.string :specific # 専門のもの
      

      
      t.timestamps
    end
  end
end
