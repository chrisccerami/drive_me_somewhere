class Rating < ActiveRecord::Base
  belongs_to :driver

  validates :score, presence: true
end
