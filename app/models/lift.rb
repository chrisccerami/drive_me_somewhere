class Lift < ActiveRecord::Base
  belongs_to :lift_request
  belongs_to :driver
end
