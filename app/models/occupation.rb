class Occupation < ApplicationRecord
	has_many :shops, through: :shop_occupations
	has_many :shop_occupations
end
