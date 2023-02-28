class BookingsController < ApplicationController
  def new
    @workspace = Workspace.find(params[:workspace_id])
    @booking = Booking.new
  end

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @booking = Booking.new(strong_params)
    @booking.workspace = @workspace
    @booking.user = current_user
    if @booking.save
      redirect_to workspaces_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to workspaces_path, status: :see_other
  end

  private

  def strong_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
