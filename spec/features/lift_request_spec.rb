require "rails_helper"

feature "Lift Request" do
  context "creating a request" do
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit new_lift_request_path
    end

    it "with valid attributes" do
      fill_in "Origin Longitude", with: 42.349932
      fill_in "Origin Latitude", with: -71.163295
      fill_in "Origin Address", with: "18 Fairbanks St"
      fill_in "Origin City", with: "Boston"
      fill_in "Origin State", with: "MA"
      fill_in "Origin Zip Code", with: "02135"

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

    it "with invalid attributes" do
      click_on "Request a Ride"

      expect(page).to have_content "can't be blank"
      expect(page).to have_content "is invalid"
    end
  end

  context "editing a request" do
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in(user)
      lift_request = FactoryGirl.create(:lift_request, user: user)

      visit edit_lift_request_path(lift_request)
    end

    it "with valid attributes" do
      fill_in "Destination Address", with: "33 Harrison St"
      fill_in "Destination City", with: "Boston"
      fill_in "Destination State", with: "MA"
      fill_in "Destination Zip Code", with: "02112"
      click_on "Update Lift Request"

      expect(page).to have_content "Request updated"
      expect(page).to have_content "33 Harrison St"
    end

    it "with invalid attributes" do
      fill_in "Destination Address", with: ""
      click_on "Update Lift Request"

      expect(page).to have_content "can't be blank"
      expect(page).to have_content "is invalid"
    end
  end

  context "deleting a request" do
    it "removes the request" do
      user = FactoryGirl.create(:user)
      sign_in(user)
      lift_request = FactoryGirl.create(:lift_request, user: user)

      visit lift_request_path(lift_request)

      click_on "Cancel Request"

      expect(page).to have_content "Request cancelled"
      expect(page).not_to have_content lift_request.destination.address
    end
  end
end
