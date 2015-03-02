class Driver < ActiveRecord::Base
  belongs_to :user
  has_many :ratings
  has_many :cars

  validates :license_number, presence: true
end
