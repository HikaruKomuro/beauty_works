class Facility < ApplicationRecord
	has_many :shops, through: :shop_facilities
	has_many :shop_facilities
end
