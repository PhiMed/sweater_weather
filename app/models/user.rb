class User < ApplicationRecord
  has_many :roadtrips

  validates_presence_of :password, require: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

end
