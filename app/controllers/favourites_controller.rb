class FavouritesController < ApplicationController

  def index
    @favourites = current_user.favourites
  end

  #   # def create
  #   #   @workspace = Workspace.find(params[:workspace_id])
  #   #   @booking = Booking.new(strong_params)
  #   #   @booking.workspace = @workspace
  #   #   @booking.user = current_user
  #   #   if @booking.save
  #   #     redirect_to bookings_path
  #   #   else
  #   #     render :new, status: :unprocessable_entity
  #   #   end
  #   # end

    def destroy
      @favourite = Favourite.find(params[:id])
      @favourite.destroy
      redirect_to favourites_path, status: :see_other
    end

    # private

    # def strong_params
    #   params.require(:booking).permit(:start_date, :end_date)
    # end


end
