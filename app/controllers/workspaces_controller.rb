class WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.all
  end

  def show
    @workspace = Workspace.find(params[:id])
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(strong_params)
    @user = current_user
    @workspace.user = @user
    if @workspace.save
      redirect_to workspaces_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @workspace = Workspace.find[params[:id]]
    @workspace.delete
    redirect_to workspaces_path, status: :see_other
  end

  private

  def strong_params
    params.require(:workspace).permit(:name, :price, :address, :photos)
  end
end
