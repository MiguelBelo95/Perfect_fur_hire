class Pet < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, presence: true
  validates :breed, presence: true
end
