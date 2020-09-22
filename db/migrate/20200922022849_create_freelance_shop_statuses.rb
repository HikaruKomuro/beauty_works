class CreateFreelanceShopStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :freelance_shop_statuses do |t|
      t.references :freelance, foreign_key: true
      t.references :shop, foreign_key: true
      t.boolean :sign_up  # 契約済かどうか
      t.boolean :interviewed  # 面接済かどうか

      t.timestamps
    end
  end
end
