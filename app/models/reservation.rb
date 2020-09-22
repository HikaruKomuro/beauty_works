class Reservation < ApplicationRecord
  belongs_to :freelance
  belongs_to :shop
end
