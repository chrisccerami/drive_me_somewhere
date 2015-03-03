class Lift < ActiveRecord::Base
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
end
