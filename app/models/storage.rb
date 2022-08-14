class Storage < ApplicationRecord
  belongs_to :user
  validates :price, presence: true
  validates :title, presence: true
  validates :address, presence: true
  validates :meters, presence: true
end
