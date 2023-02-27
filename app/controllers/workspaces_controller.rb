class WorkspacesController < ApplicationController
  def index
    @workspace = Workspace.find(params[:id])
  end

  def show
    @workspaces = Workspace.all
  end
end
