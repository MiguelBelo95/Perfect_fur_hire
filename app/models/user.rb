class User < ApplicationRecord
  has_many :pets
  has_many :bookings

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
