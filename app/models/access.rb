class Access < ApplicationRecord
  belongs_to :shop, dependent: :destroy
end
