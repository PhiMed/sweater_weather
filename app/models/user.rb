class User < ApplicationRecord
  has_many :roadtrips

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

end
