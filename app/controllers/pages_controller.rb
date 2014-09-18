class PagesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  def list

  end

  def show
    # @page = Page.find params[:id]
    @page = Page.friendly.find(params[:id])
  end

  def edit
    @page = Page.friendly.find(params[:id])
  end
  
  def update
    @page = Page.friendly.find params[:id]
    if @page.update_attributes (page_params)
      redirect_to list_pages_path
    else
      render :action => :edit
    end
  end

  def index_page
    @pages = Page.page(params[:page]).per_page(10)
  end

  def index
    @pages = Page.all
    @news_items = NewsItem.limit(5)
    render layout: 'index'
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to list_pages_path
    else
      render :action => 'new'
    end    
  end

  def delete
  end

  def destroy
    @page = Page.find params[:id]
    @page.destroy
    redirect_to list_pages_path
  end

  private

  def page_params
    params.require(:page).permit(:name, :permalink, :content, :parent_id, :place)
  end


end
