require "rails_helper"

feature "Applying to be a driver" do
  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit "/"
    click_on "Apply to Become a Driver"
  end

  it "accepts valid inputs" do
    fill_in "Driver's License Number", with: "XXXXXXXXX"
    fill_in "Make", with: "Toyota"
    fill_in "Model", with: "Corolla"
    fill_in "Year", with: "2010"
    fill_in "Color", with: "Magnetic Grey"
    fill_in "License Plate", with: "A99ABC"
    click_on "Submit"

    expect(page).to have_content "Application submitted"
  end

  it "rejects invalid inputs" do
    click_on "Submit"

    expect(page).to have_content "can't be blank"
  end
end
