class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(strong_params)
    @workspace = Workspace.find(params[:workspace_id])
    @booking.workspace = @workspace
    @user = current_user
    booking.user = @user
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
end
