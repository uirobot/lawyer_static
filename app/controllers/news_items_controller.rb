class NewsItemsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  @sidebar = 'hello'

  def show
    @no_sidebar = true
    @news_item = NewsItem.find params[:id]
  end

  def edit
    @news_item = NewsItem.find(params[:id])
  end

  def update
    @news_item = NewsItem.find params[:id]
    if @news_item.update_attributes (news_item_params)
      redirect_to list_news_items_path
    else
      render :action => :edit
    end
  end

  def index_page
    @news_items = NewsItem.all
  end

  def index
    @no_sidebar = true
    @news_items = NewsItem.all.page(params[:page]).per_page(10)
  end

  def new
    @news_item = NewsItem.new
  end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to list_news_items_path
    else
      render :action => 'new'
    end
  end


  def destroy
    @news_item = NewsItem.find params[:id]
    @news_item.destroy
    redirect_to list_news_items_path
  end

  private

  def news_item_params
    params.require(:news_item).permit(:title, :body)
  end
end
