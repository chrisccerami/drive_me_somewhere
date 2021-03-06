class LiftsController < ApplicationController
  def show
    @lift = Lift.find(params[:id])
    @origin = @lift.point_a(request)
    @destination = @lift.point_b
  end

  def create
    @lift_request = LiftRequest.find(params[:lift_request_id])
    @lift = @lift_request.build_lift(driver: current_user.driver,
                                     status: "accepted")
    if @lift.save
      flash[:notice] = "Lift accepted"
      redirect_to lift_path(@lift)
    else
      render lift_request_path(@lift_request)
    end
  end

  def destroy
    @lift = current_user.driver.lifts.find(params[:id])
    if @lift.destroy
      flash[:notice] = "Lift cancelled"
      redirect_to lift_requests_path
    else
      render :show
    end
  end

  def pickup
    @lift = current_user.driver.lifts.find(params[:id])
    if @lift.update(status: "in progress", pickup_at: Time.zone.now)
      flash[:notice] = "Lift started"
      redirect_to lift_path(@lift)
    else
      render :show
    end
  end

  def dropoff
    @lift = current_user.driver.lifts.find(params[:id])
    @lift.calculate_distance
    if @lift.update(status: "complete", dropoff_at: Time.zone.now)
      flash[:notice] = "Lift completed"
      redirect_to lift_path(@lift)
    else
      render :show
    end
  end
end
