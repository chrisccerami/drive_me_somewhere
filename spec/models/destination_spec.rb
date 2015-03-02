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

  context "geocoding" do
    it "should geocode before saving" do
      destination = Destination.create(address: "66 Kenzel Ave",
                                       city: "Nutley", state: "NJ",
                                       zip_code: "07110")

      expect(destination.longitude).not_to eq(nil)
      expect(destination.latitude).not_to eq(nil)
    end

    it "should add an error if geocoding fails" do
      destination = Destination.create

      error_messages = destination.errors.full_messages
      expect(error_messages).to include("Longitude Geocoding failed")
      expect(error_messages).to include("Latitude Geocoding failed")
    end

    it "prioritizes entered lat and lng over geocoded values" do
      destination = Destination.create(address: "66 Kenzel Ave",
                                       city: "Nutley", state: "NJ",
                                       zip_code: "07110", latitude: 40.834362,
                                       longitude: -74.162015)
      expect(destination.latitude.to_f).to eq 40.834362
      expect(destination.longitude.to_f).to eq -74.162015
    end
  end

  it "formats the address" do
    destination = Destination.new(address: "66 Kenzel Ave", city: "Nutley",
                                  state: "NJ", zip_code: "07110")
    expect(destination.full_address).to eq "66 Kenzel Ave, Nutley, NJ 07110"
  end
end
