class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.references :owner
      t.string :name
      t.string :email
      t.string :line_id
      t.string :phone_number
      t.boolean :display
      
      # 住所
      t.string :post_code
      t.string :address_prefecture
      t.string :address_city
      t.string :address_branch
      t.string :address_building
      
      # 職種
      t.boolean :nail
      t.boolean :hair
      t.boolean :eye
      t.boolean :body
      t.boolean :therapy
      t.boolean :sinkyu
      t.boolean :seitai
      t.boolean :divination
      
      # 営業時間
      t.datetime :sun_start
      t.datetime :sun_finish
      t.datetime :mon_start
      t.datetime :mon_finish
      t.datetime :tue_start
      t.datetime :tue_finish
      t.datetime :wed_start
      t.datetime :wed_finish
      t.datetime :the_start
      t.datetime :the_finish
      t.datetime :fri_start
      t.datetime :fri_finish
      t.datetime :sat_start
      t.datetime :sat_finish
      t.string :day_off
      
      t.text :appeal  #　アピールポイント
      t.text :memo  # 注意点
      t.boolean :introduction   # 紹介制度
      t.string :customer_sex
      t.string :worker_sex
       # t.boolean :friend_sharing
       
      t.timestamps
    end
  end
end
