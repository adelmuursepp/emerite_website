class CheckboxesController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
  end

  def comment_params
    params.require(:checkbox).permit(:checked)
  end
end
