class Owner < ApplicationRecord
  has_many :shop, dependent: :destroy
end
