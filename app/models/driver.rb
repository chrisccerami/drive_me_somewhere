class Driver < ActiveRecord::Base
  belongs_to :user
  has_many :ratings

  validates :license_number, presence: true
end
