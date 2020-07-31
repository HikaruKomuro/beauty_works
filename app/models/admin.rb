class Admin < ApplicationRecord
  
  attr_accessor :remember_token
  
  validates :name, presence: true, length: { maximum: 50 }
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
              format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  before_save { self.post_code = post_code.downcase }
  validates :post_code, presence: true, length: { is: 7 }
  validates :address_prefecture, presence: true
  before_save { self.address_city = address_city.upcase }
  validates :address_city, presence: true, length: { maximum: 50 }
  validates :address_branch, length: { maximum: 50 }
  
  def Admin.digest(string)
    cost =
    if ActiveModel::SecurePassword.min_cost
      BCrypt::Engine::MIN_COST
    else
      BCrypt::Engine.cost
    end
    BCrypt::Password.create(string, cost: cost)
  end
  
  def Admin.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Admin.new_token
    update_attribute(:remember_digest, Admin.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def self.search(search) 
    if search
      where(['name LIKE ?', "%#{search}%"]) 
    else
      all
    end
  end
    
  def self.updatable_attributes
    ["name", "email", "password"]
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