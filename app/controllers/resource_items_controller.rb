class ResourceItemsController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_item, only: [:edit, :update, :destroy, :toggle_status]
  layout "resource_item"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all

  def index
    @resource_items = ResourceItem.protect_drafts(current_user).by_recent.page(params[:page]).per(5)
    @page_title = "Class"
  end

  def show
    @resource_item = ResourceItem.includes(:resource_comments).find(params[:id])
    # if logged_in?(:site_admin) || @resource_item.published?
    if true
      @resource_comment = ResourceComment.new
      @resource_comment.resource_item_id = @resource_item.id
      @page_title = @resource_item.title
      # @seo_keywords = @resource_item.body
    else
      redirect_to resource_items_path, notice: "You are not authorized to access this page"
    end
  end

  def new
    @resource_item = ResourceItem.new
    10.times { @resource_item.questions.build }
    5.times { @resource_item.checkboxes.build }
    @page_title = "Create a New Post"
  end

  def edit
    @page_title = "Editing \"" + @resource_item.title + "\""
  end

  def create
    @resource_item = ResourceItem.new(item_params)

    respond_to do |format|
      if @resource_item.save
        format.html { redirect_to @resource_item, notice: 'Your post has been created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @resource_item.update(item_update_params)
        format.html { redirect_to @resource_item, notice: 'The post has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @resource_item.destroy
    respond_to do |format|
      format.html { redirect_to resource_items_url, notice: 'The post has been deleted.' }
    end
  end

  def toggle_status
    if @resource_item.draft?
      @resource_item.published!
    elsif @resource_item.published?
      @resource_item.draft!
    end
    respond_to do |format|
      format.html { redirect_to resource_items_url, notice: 'Post status has been updated.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @resource_item = ResourceItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:resource_item).permit(:title, :cdong_task, :body, :written_task, :resource_topic_id, :status, :checbox, :created_at, questions_attributes: [:question_text, :option1, :explanation1, :option2, :explanation2, :option3, :explanation3], checkboxes_attributes: [:label])
    end
    def item_update_params
      params.require(:resource_item).permit(:title, :cdong_task, :body, :written_task, :resource_topic_id, :status, :checbox, :created_at, checkboxes_attributes: [:label])
    end


end
