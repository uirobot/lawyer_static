class PagesController < ApplicationController
  def list

  end

  def show
    #@page = Page.find params[:id]
    @page = Page.friendly.find params[:id]
  end

  def edit
    @page = Page.friendly.find params[:id]
  end
  
  def update
    @page = Page.friendly.find params[:id]
    if @page.update_attributes (page_params)
      redirect_to pages_path
    else
      render :action => :edit
    end
  end

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to pages_path
    else
      render :action => 'new'
    end    
  end

  def delete
  end

  def destroy
    @page = Page.find params[:id]
    @page.destroy
    redirect_to pages_path
  end

  private

  def page_params
    params.require(:page).permit(:name, :permalink, :content)
  end
end
