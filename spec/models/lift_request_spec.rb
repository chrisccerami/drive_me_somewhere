require "rails_helper"

describe LiftRequest do
  describe "attributes" do
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
    it { should respond_to :user_id }
  end

  describe "associations" do
    it { should have_one :origin }
    it { should have_one :destination }
    it { should have_one :lift }
    it { should belong_to :user }
  end
end
