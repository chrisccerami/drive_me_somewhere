class LiftRequest < ActiveRecord::Base
  has_one :origin, dependent: :destroy
  has_one :destination, dependent: :destroy
  has_one :lift, dependent: :destroy

  belongs_to :user

  validates_associated :origin
  validates_associated :destination
end
