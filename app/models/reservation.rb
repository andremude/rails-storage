class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :storage
  validates :start_date, presence: true
  validates :quantity, presence: true
end
