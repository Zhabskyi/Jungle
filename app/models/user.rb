class User < ActiveRecord::Base
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

   before_validation :strip_whitespace

  def authenticate_with_credentials (email, password)
    new_email = email.downcase
    user = User.find_by_email(new_email)
   
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end


  def strip_whitespace
    self.email = self.email.strip unless self.email.nil?
  end

end
