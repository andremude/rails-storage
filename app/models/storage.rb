class Storage < ApplicationRecord
  serialize :features
  belongs_to :user
  validates :price, presence: true
  validates :title, presence: true
  validates :address, presence: true
  validates :meters, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :storage_type, presence: true
  # validates :features, presence: true
  has_many_attached :photos
  has_many :reservations
  accepts_nested_attributes_for :reservations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def unavailable_dates
    reservations.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

end
