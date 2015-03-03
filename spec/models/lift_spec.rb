require 'rails_helper'

RSpec.describe Lift do
  describe "attributes" do
    it { should respond_to :pickup_at }
    it { should respond_to :dropoff_at }
    it { should respond_to :distance }
    it { should respond_to :status }
  end

  describe "associations" do
    it { should belong_to :lift_request }
    it { should belong_to :driver }
  end
end
