require 'rails_helper'

RSpec.describe Driver do
  describe "attributes" do
    it { should respond_to :user_id }
    it { should respond_to :license_number }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should have_many :cars }
    it { should have_many :ratings }
  end

  describe "validations" do
    it { should validate_presence_of :license_number }
  end

  it "shouldn't be approved by default" do
    driver = Driver.new
    expect(driver.approved).to eq false
  end
end
