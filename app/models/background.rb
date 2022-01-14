class Background < ApplicationRecord

  validates :location, presence: true
  validates :img_url, presence: true
  validates :source, presence: true
  validates :author, presence: true
end
