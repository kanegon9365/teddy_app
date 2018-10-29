class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length:{ maximum: 20 }
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{ maximum: 50 },
                    format: { with: VALID_EMAIL },
                    uniqueness: { case_sensitive: false }
  validates :profile, length:{ maximum: 300 }
  has_secure_password
  validates :password, presence: true, length:{minimum: 6}
end
