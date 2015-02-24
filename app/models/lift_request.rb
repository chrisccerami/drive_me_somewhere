class LiftRequest < ActiveRecord::Base
  has_one :origin
  has_one :destination
end
