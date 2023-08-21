class User < ApplicationRecord
  has_many :pets
  has_many :bookings

  validates :username, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
