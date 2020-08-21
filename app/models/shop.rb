class Shop < ApplicationRecord
  belongs_to :owner
  has_many :fees, through: :shop_fees
  has_many :shop_fees
  has_many :options, through: :shop_options
  has_many :shop_options
  
 
  has_many :access, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 50 }
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 100 },
              format: { with: VALID_EMAIL_REGEX }, uniqueness: true
                
  validates :phone_number, length: { in: 10..11 }, numericality: { only_integer: true }
  
  before_save { self.post_code = post_code.downcase }
  validates :post_code, presence: true, length: { is: 7 }
  validates :address_prefecture, presence: true
  before_save { self.address_city = address_city.upcase }
  validates :address_city, presence: true, length: { maximum: 50 }
  before_save { self.address_branch = address_branch.upcase }
  validates :address_branch, length: { maximum: 50 }
  
  def self.search(search) 
    if search
      where(['name LIKE ?', "%#{search}%"]) 
    else
      all
    end
  end
    
  
  # 住所自動入力
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
end
