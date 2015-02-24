class LiftRequest < ActiveRecord::Base
  has_one :origin
  has_one :destination

  belongs_to :user

  validates_associated :origin
  validates_associated :destination
end
