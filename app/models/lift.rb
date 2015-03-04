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
    status == "accepted"
  end

  def in_progress?
    status == "in progress"
  end

  def complete?
    status == "complete"
  end

  def point_a(request)
    if self.accepted?
      loc = request.location
      { lat: loc.latitude,
        lng: loc.longitude }
    elsif self.in_progress? || self.complete?
      { lat: origin.latitude,
        lng: origin.longitude }
    end
  end

  def point_b
    if self.accepted?
      { lat: origin.latitude,
        lng: origin.longitude }
    elsif self.in_progress? || self.complete?
      { lat: destination.latitude,
        lng: destination.longitude }
    end
  end
end
