class LiftsController < ApplicationController
  def show
    @lift = Lift.find(params[:id])
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
end
