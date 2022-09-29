class Storage < ApplicationRecord
  belongs_to :user
  validates :price, presence: true
  validates :title, presence: true
  validates :address, presence: true
  validates :meters, presence: true
  # has_many_attached :photos
  has_many :reservations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
