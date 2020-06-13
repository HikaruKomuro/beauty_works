class Admin < ApplicationRecord
  
  attr_accessor :remember_token
  
  validates :name, presence: true, length: { maximum: 50 }
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
              format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  
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
    
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      admin = new
      admin.attributes = row.to_hash.slice(*updatable_attributes)
      admin.save!
    end
  end
    
  def self.updatable_attributes
    ["name", "email",  "password"]
  end
  
  
end