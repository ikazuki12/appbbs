class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = session[:user_id]
    if @message.save
      redirect_to messages_path
    else
      render 'new'
    end

  end

  private

    def message_params
      params[:message].permit(:subject, :text, :category)
    end


end
