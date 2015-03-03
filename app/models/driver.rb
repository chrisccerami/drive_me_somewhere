class Driver < ActiveRecord::Base
  belongs_to :user
  has_many :ratings
  has_many :cars
  has_many :lifts

  validates :license_number, presence: true
end
