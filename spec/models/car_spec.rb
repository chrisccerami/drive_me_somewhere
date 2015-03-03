require 'rails_helper'

RSpec.describe Car do
  describe "attributes" do
    it { should respond_to :make }
    it { should respond_to :model }
    it { should respond_to :year }
    it { should respond_to :color }
    it { should respond_to :license_plate }
  end

  describe "associations" do
    it { should belong_to :driver }
  end

  describe "validations" do
    it { should validate_presence_of :make }
    it { should validate_presence_of :model }
    it { should validate_presence_of :year }
    it { should validate_presence_of :color }
    it { should validate_presence_of :license_plate }
  end
end
