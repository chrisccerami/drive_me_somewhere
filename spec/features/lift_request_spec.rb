require "rails_helper"

feature "Lift Request" do
  it "creates a request with valid attributes" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit new_lift_request_path

    fill_in "Origin Longitude", with: 42.349932
    fill_in "Origin Latitude", with: -71.163295
    fill_in "Origin Address", with: "18 Fairbanks St"
    fill_in "Origin City", with: "Boston"
    fill_in "Origin State", with: "MA"
    fill_in "Origin Zip Code", with: "07110"

    fill_in "Destination Longitude", with: 40.834362
    fill_in "Destination Latitude", with: -74.162015
    fill_in "Destination Address", with: "66 Kenzel Ave"
    fill_in "Destination City", with: "Nutley"
    fill_in "Destination State", with: "NJ"
    fill_in "Destination Zip Code", with: "07110"

    click_on "Request a Ride"

    expect(page).to have_content "Request created"
    expect(page).to have_content "18 Fairbanks St"
    expect(page).to have_content "66 Kenzel Ave"
  end

  it "doesn't create a request with invalid attributes" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit new_lift_request_path

    click_on "Request a Ride"

    expect(page).to have_content "is invalid"
  end
end
