class Availability < ApplicationRecord
  belongs_to :pet

  validates :start_date, presence: true
  validates :end_date, presence: true
end
