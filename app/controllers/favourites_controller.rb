class FavouritesController < ApplicationController

  def index
    @favourites = current_user.favourites
  end

    def create
      @favourite = Favourite.create(workspace_id: params[:workspace_id], user_id: current_user.id)
      redirect_to workspaces_path
    end

    def destroy
      @favourite = Favourite.find(params[:id])
      @favourite.destroy
      redirect_back fallback_location: workspaces_path
    end

    # private



end
