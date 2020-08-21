class ShopOption < ApplicationRecord
  belongs_to :shop
  belos_to :option
  
end
