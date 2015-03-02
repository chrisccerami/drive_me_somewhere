class Car < ActiveRecord::Base
  belongs_to :driver

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :license_plate, presence: true
end
