class MessagesController < ApplicationController
  before_action :authenticate_user!, :except => [:create]

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to :back
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def index
    @messages = Message.select(:id, :name).page(params[:page]).per_page(10)
  end

  def destroy
    @message = Message.find params[:id]
    @message.destroy
    redirect_to messages_path
  end

  private

    def message_params
      params.permit(:name, :phone, :email, :category, :question)
    end
end
