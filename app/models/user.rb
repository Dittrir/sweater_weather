class User < ApplicationRecord
  validates :email,
            :format => { with: URI::MailTo::EMAIL_REGEXP },
            :presence => {message: "can't be blank"},
            :uniqueness => true
  validates :password_digest,
            :presence => {message: "can't be blank"}

  has_secure_password

  before_create :add_api_key
private
  def add_api_key
    self.api_key = SecureRandom.hex(27)
  end
end
