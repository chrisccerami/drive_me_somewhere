class Destination < ActiveRecord::Base
  belongs_to :lift_request

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
end
