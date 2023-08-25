class Pet < ApplicationRecord
  has_many :bookings

  has_many :availabilities
  belongs_to :user
  has_one_attached :image


  validates :name, presence: true
  validates :breed, presence: true
  validates :image, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def available?(start_date, end_date)
    Availability
      .where(pet: self)
      .where("start_date <= :start_date AND end_date >= :end_date", { start_date: start_date, end_date: end_date })
      .exists?
  end
end
