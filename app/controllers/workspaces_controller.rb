class WorkspacesController < ApplicationController
  def index
    if params[:query].present?
      @workspaces = Workspace.search_by_address_and_description(params[:query])
      @markers = @workspaces.geocoded.map do |workspace|
      {
          lat: workspace.latitude,
          lng: workspace.longitude,
      }
      end
    else
      @workspaces = Workspace.all
      @markers = @workspaces.geocoded.map do |workspace|
      {
          lat: workspace.latitude,
          lng: workspace.longitude,
      }
    end
    end
  end

  def show
    @workspace = Workspace.find(params[:id])
    @booking = Booking.new
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(strong_params)
    @user = current_user
    @workspace.user = @user
    if @workspace.save
      redirect_to workspace_path(@workspace)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy
    redirect_to workspaces_path, status: :see_other
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    @workspace.update(strong_params)
    redirect_to workspace_path(@workspace)
  end

  def my_workspaces
    user = current_user
    @workspaces = user.workspaces
  end

  private

  def strong_params
    params.require(:workspace).permit(:name, :price, :address, :description, photos: [])
  end
end
