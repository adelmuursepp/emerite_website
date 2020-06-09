class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @posts = Blog.limit(3)

  end

  def about
    @page_title = "About"
  end

  def contact
  end
end
