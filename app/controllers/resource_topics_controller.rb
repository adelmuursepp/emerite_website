class ResourceTopicsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @resource_topic = ResourceTopic.find(params[:id])
  end
end
