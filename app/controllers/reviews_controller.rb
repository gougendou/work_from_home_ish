class ReviewsController < ApplicationController

    def create
        @workspace = Workspace.find(params[:workspace_id])
        @review = Review.new(review_params)
        @review.workspace = @workspace
        if @review.save
            redirect_to workspace_path(@workspace)
        else
            render "workspaces/show", status: :unprocessable_entity
        end
    end

private

    def review_params
        params.require(:review).permit(:content)
    end
end
