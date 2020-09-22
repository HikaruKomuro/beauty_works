class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.references :owner
      t.string :name
      t.string :email
      t.string :line_id
      t.string :phone_number
      t.boolean :display
      t.string :note
      
      # 住所
      t.string :post_code
      t.string :address_prefecture
      t.string :address_city
      t.string :address_town
      t.string :address_branch
      t.string :address_building
      
      # 営業時間
      t.time :mon_start
      t.time :mon_finish
      t.boolean :mon_off
      t.time :tue_start
      t.time :tue_finish
      t.boolean :tue_off
      t.time :wed_start
      t.time :wed_finish
      t.boolean :wed_off
      t.time :thu_start
      t.time :thu_finish
      t.boolean :thu_off
      t.time :fri_start
      t.time :fri_finish
      t.boolean :fri_off
      t.time :sat_start
      t.time :sat_finish
      t.boolean :sat_off
      t.time :sun_start
      t.time :sun_finish
      t.boolean :sun_off
      t.string :other_holiday
      
      t.text :appeal  #　アピールポイント
      t.text :memo  # 注意点
      t.boolean :introduction   # 紹介制度
      t.integer :customer_sex  # 顧客の性別制限（0: 男女可、1: 女性のみ、2: 男性のみ）
      t.integer :worker_sex # 施術者の性別制限（0: 男女可、1: 女性のみ、2: 男性のみ）
      t.boolean :share
       
      t.timestamps
    end
  end
end
