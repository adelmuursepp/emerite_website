class ResourceCategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @resource_categories = ResourceCategory.all
  end

  def show
    @resource_category = ResourceCategory.find(params[:id])
  end

end
