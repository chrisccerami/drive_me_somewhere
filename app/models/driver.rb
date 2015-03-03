class Driver < ActiveRecord::Base
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :lifts, dependent: :destroy

  validates :license_number, presence: true
end
