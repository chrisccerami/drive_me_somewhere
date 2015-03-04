class Lift < ActiveRecord::Base
  include Geokit::Geocoders
  belongs_to :lift_request
  belongs_to :driver
  has_one :origin, through: :lift_request
  has_one :destination, through: :lift_request

  def pickup_time
    pickup_at.strftime("%l:%M%p")
  end

  def dropoff_time
    dropoff_at.strftime("%l:%M%p")
  end

  def calculate_distance
    self.distance = origin.distance_to(destination)
  end

  def formatted_distance
    distance.round(2)
  end

  def accepted?
    self.status == "accepted"
  end

  def in_progress?
    self.status == "in progress"
  end

  def complete?
    self.status == "complete"
  end

  def point_a(request)
    if self.accepted?
      loc = Geokit::Geocoders::IpGeocoder.geocode(request.ip)
      { lat: loc.lat,
        lng: loc.lng }
    elsif self.in_progress? || self.complete?
      { lat: self.origin.latitude,
        lng: self.origin.longitude }
    end
  end

  def point_b
    if self.accepted?
      { lat: self.origin.latitude,
        lng: self.origin.longitude }
    elsif self.in_progress? || self.complete?
      { lat: self.destination.latitude,
        lng: self.destination.longitude }
    end
  end
end
