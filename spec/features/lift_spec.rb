require "rails_helper"

feature "Driver accepts a passenger" do
  it "claims the passenger" do
    driver = FactoryGirl.create(:driver)
    request = FactoryGirl.create(:lift_request)
    sign_in(driver.user)
    visit lift_request_path(request)
    click_on "Accept Lift"

    expect(page).to have_content "Lift accepted"
    expect(page).to have_content request.origin.address
  end
end
