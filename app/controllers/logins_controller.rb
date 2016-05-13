class LoginsController < ApplicationController

  skip_filter :authenticate

  def show
    render "new", :layout => false
  end

  def create
    if User.exists?(:login_id => params[:login_id], :password => params[:password])
      user = User.find_by(:login_id => params[:login_id])
      session[:user_id] = user.id
      redirect_to :root
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to :root
  end

end
