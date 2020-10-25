require 'rails_helper'

RSpec.describe Fee, type: :model do
  let(:shop) { FactoryBot.create(:shop) }

  # shop_idの存在
  describe "presence of shop_id" do
    # shop_idがあれば有効な状態であること
    it "is valid with a shop_id" do
      fee = Fee.new(shop_id: shop.id)
      expect(fee).to be_valid
    end

    # shop_idがなければ無効な状態であること
    it "is invalid without a shop_id" do
      fee = Fee.new(shop_id: nil)
      fee.valid?
      expect(fee.errors[:shop]).to include("を入力してください")
    end
  end
end
