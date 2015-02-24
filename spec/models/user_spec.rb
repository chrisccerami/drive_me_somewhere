require 'rails_helper'

RSpec.describe User do
  describe "attributes" do
    it { should respond_to :email }
    it { should respond_to :phone }
    it { should respond_to :name }
  end

  describe "associations" do
    it { should have_many :lift_requests }
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :phone }
  end
end
