class User < ApplicationRecord
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :name, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6, maximum: 255 }
  validates :email, presence: true, length: { minimum: 10, maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  has_secure_password
  has_many :groups
  has_many :transactions

  def forget_me
    update_attribute(:remember_token, nil)
  end

  def auth(token)
    remember_token == token
  end

  def create_remember_token
    rem_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
    self.remember_token = rem_token
  end
end
