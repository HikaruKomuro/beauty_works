require 'rails_helper'

RSpec.describe Occupation, type: :model do
  let(:occupation) { FactoryBot.create(:occupation) }

  describe "dependent: destoy" do
    # occupationを削除すると、紐づくshop_occupationsも全て削除されること
    it "destroys all shop_occupations when deleted" do
      2.times { FactoryBot.create(:shop) }
      ShopOccupation.create(occupation_id: occupation.id, shop_id: Shop.first.id)
      ShopOccupation.create(occupation_id: occupation.id, shop_id: Shop.second.id)
      expect { occupation.destroy }.to change(ShopOccupation.all, :count).by(-2)
    end

    # occupationを削除すると、紐づくfreelance_occupationsも全て削除されること
    it "destroys all freelance_occupations when deleted" do
      2.times { FactoryBot.create(:freelance) }
      FreelanceOccupation.create(occupation_id: occupation.id, freelance_id: Freelance.first.id)
      FreelanceOccupation.create(occupation_id: occupation.id, freelance_id: Freelance.second.id)
      expect { occupation.destroy }.to change(FreelanceOccupation.all, :count).by(-2)
    end
  end
end
