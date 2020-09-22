class ShopOccupation < ApplicationRecord
  belongs_to :shop
  belongs_to :occupation
end
