class CommentsController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.build(comment_params)
    @comment.user_id = session[:user_id]
    @comment.save
    redirect_to :root
  end

  private

  def comment_params
    params[:comment].permit(:text)
  end
end
