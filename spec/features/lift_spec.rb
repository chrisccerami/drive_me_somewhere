require "rails_helper"

feature "Driver accepts a passenger" do
  before(:each) do
    driver = FactoryGirl.create(:driver)
    @request = FactoryGirl.create(:lift_request)
    sign_in(driver.user)
    visit lift_request_path(@request)
    click_on "Accept Lift"
  end

  it "claims the passenger" do
    expect(page).to have_content "Lift accepted"
    expect(page).to have_content @request.origin.address
  end

  it "picks up a passenger" do
    click_on "Start Lift"

    expect(page).to have_content "Lift started"
    expect(page).to have_content @request.lift.pickup_time
  end
end
