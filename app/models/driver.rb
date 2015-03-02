class Driver < ActiveRecord::Base
  belongs_to :user

  validates :license_number, presence: true
end
