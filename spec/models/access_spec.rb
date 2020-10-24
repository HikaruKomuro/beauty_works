require 'rails_helper'

RSpec.describe Access, type: :model do
  let(:shop) { FactoryBot.create(:shop) }

  # shop_idの存在
  describe "presence of shop_id" do
    # shop_idがあれば有効な状態であること
    it "is valid with a shop_id" do
      access = Access.new(shop_id: shop.id)
      expect(access).to be_valid
    end

    # shop_idがなければ無効な状態であること
    it "is invalid without a shop_id" do
      access = Access.new(shop_id: nil)
      access.valid?
      expect(access.errors[:shop]).to include("を入力してください")
    end
  end
end
