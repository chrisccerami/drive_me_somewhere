class LiftRequestsController < ApplicationController
  def show
    @lift_request = LiftRequest.find(params[:id])
  end

  def new
    @lift_request = LiftRequest.new
  end

  def create
    @lift_request = current_user.lift_requests.build
    @lift_request.create_origin(origin_params)
    @lift_request.create_destination(destination_params)
    if @lift_request.save
      flash[:notice] = "Request created"
      redirect_to lift_request_path(@lift_request)
    else
      render :new
    end
  end

  def edit
    @lift_request = current_user.lift_requests.find(params[:id])
  end

  def update
    @lift_request = current_user.lift_requests.find(params[:id])
    @lift_request.origin.update(origin_params)
    @lift_request.destination.update(destination_params)
    if @lift_request.save
      flash[:notice] = "Request updated"
      redirect_to lift_request_path(@lift_request)
    else
      render :edit
    end
  end

  private

  def origin_params
    params.require(:origin).permit(:longitude, :latitude,
                                  :address, :city,
                                  :state, :zip_code
                                  )
  end

  def destination_params
    params.require(:destination).permit(:longitude, :latitude,
                                        :address, :city,
                                        :state, :zip_code
                                        )
  end
end
