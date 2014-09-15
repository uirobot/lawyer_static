class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :add_top_menu_vars

  def add_top_menu_vars
    @licence = Page.find_by_id(1)
    @layer_service = Page.find_by_id(2)
    @other_service = Page.find_by_id(30)
    @about = Page.find_by_id(23)
  end
end
