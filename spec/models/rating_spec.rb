require 'rails_helper'

RSpec.describe Rating do
  describe "attributes" do
    it { should respond_to :driver_id }
    it { should respond_to :score }
    it { should respond_to :comment }
  end

  describe "associations" do
    it { should belong_to :driver }
  end

  describe "validations" do
    it { should validate_presence_of :score }
  end
end
