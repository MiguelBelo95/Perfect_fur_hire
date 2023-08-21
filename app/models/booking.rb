class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :period_must_be_during_availability

  def period_must_be_during_availability
    unless pet.available?(start_date, end_date)
      # the booking is not valid
      # since this is not related to a column in particular but to the
      # booking as a whole, we add an error to `:base`, i.e. the booking object
      # see: https://guides.rubyonrails.org/active_record_validations.html#errors-base
      errors.add(:base, :invalid, message: "The pet is not available")
    end
  end
end
