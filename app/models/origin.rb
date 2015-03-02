class Origin < ActiveRecord::Base
  include Geokit::Geocoders

  belongs_to :lift_request
  acts_as_mappable

  before_validation :geocode

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  def full_address
    "#{address}, #{city}, #{state} #{zip_code}"
  end

  def geocode
    location = Geokit::Geocoders::MultiGeocoder.geocode(full_address)
    if location.success
      self.longitude = location.lng
      self.latitude = location.lat
    else
      errors.add(:longitude, "Geocoding failed")
      errors.add(:latitude, "Geocoding failed")
    end
  end
end
