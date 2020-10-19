class Occupation < ApplicationRecord
	has_many :shops, through: :shop_occupations
	has_many :shop_occupations, dependent: :destroy
	has_many :freelances, through: :freelance_occupations
	has_many :freelance_occupations, dependent: :destroy
end
