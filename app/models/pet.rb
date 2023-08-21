class Pet < ApplicationRecord
  has_many :bookings
  has_many :availabilities
  belongs_to :user

  validates :name, presence: true
  validates :breed, presence: true

  def available?(start_date, end_date)
    Availability
      .where(pet: self)
      .where("start_date <= :start_date AND end_date >= :end_date", { start_date: start_date, end_date: end_date })
      .exists?
  end
end
