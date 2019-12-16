class User < ActiveRecord::Base
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  validates :email, presence: true,
  uniqueness: { case_sensitive: false }

end
