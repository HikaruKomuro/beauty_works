class Shop < ApplicationRecord
  belongs_to :owner
  has_many :access, dependent: :destroy
end
