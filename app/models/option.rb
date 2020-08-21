class Option < ApplicationRecord
	has_many :shops, through: :shop_options
	has_many :shop_options
end
