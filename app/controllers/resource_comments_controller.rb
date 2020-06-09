class ResourceCommentsController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    @resource_comment = ResourceComment.new(comment_params)
    @resource_comment.resource_item_id = params[:resource_item_id]

    @resource_comment.save!

    redirect_to resource_item_path(@resource_comment.resource_item)
  end

  def comment_params
    params.require(:resource_comment).permit(:content)
  end
end

