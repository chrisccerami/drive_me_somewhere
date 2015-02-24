require 'rails_helper'

RSpec.describe Destination do
  describe "attributes" do
    it { should respond_to :lift_request_id }
    it { should respond_to :longitude }
    it { should respond_to :latitude }
    it { should respond_to :address }
    it { should respond_to :city }
    it { should respond_to :state }
    it { should respond_to :zip_code }
  end

  describe "associations" do
    it { should belong_to :lift_request }
  end

  describe "validations" do
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip_code }
  end
end
