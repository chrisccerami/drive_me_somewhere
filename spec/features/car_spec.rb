require "rails_helper"

feature "Adding a car" do
  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in(user)
    @driver = FactoryGirl.create(:driver, user: user)
    visit driver_path(@driver)
    click_on "Add a Car"
  end

  it "accepts valid inputs" do
    fill_in "Make", with: "Tesla"
    fill_in "Model", with: "Roadster"
    fill_in "Year", with: "2015"
    fill_in "Color", with: "Black"
    fill_in "License Plate", with: "M22FXY"
    click_on "Add Car"

    expect(page).to have_content "Car added"
    expect(page).to have_content "Tesla Roadster (M22FXY)"
  end
end
