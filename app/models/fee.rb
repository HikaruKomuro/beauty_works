class Fee < ApplicationRecord
	has_many :shops, through: :shop_fees
	has_many :shop_fees 
end
