class DriversController < ApplicationController
  def show
    @driver = current_user.driver
  end

  def new
    @driver = Driver.new
    @car = @driver.cars.build
  end

  def create
    @driver = current_user.build_driver(driver_params)
    @car = @driver.cars.build(car_params)
    if @driver.save && @car.save
      flash[:notice] = "Application submitted"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def driver_params
    params.require(:driver).permit(:license_number)
  end

  def car_params
    params.require(:car).permit(:make, :model, :color, :year, :license_plate)
  end
end
