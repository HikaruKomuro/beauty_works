class Freelance < ApplicationRecord
  has_many :choice, dependent: :destroy
  has_one :freelance_stat
end
