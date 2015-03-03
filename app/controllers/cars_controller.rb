class CarsController < ApplicationController
  def show
    @car = current_user.driver.cars.find(params[:id])
  end

  def new
    @driver = current_user.driver
    @car = Car.new
  end

  def create
    @driver = current_user.driver
    @car = @driver.cars.build(car_params)
    if @car.save
      flash[:notice] = "Car added"
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :color, :year, :license_plate)
  end
end
