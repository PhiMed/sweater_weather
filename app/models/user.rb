class User < ApplicationRecord

  validates_presence_of :password, require: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  before_create :assign_api_key

  private

  def assign_api_key
    self.api_key = SecureRandom.hex
  end

end
