class UsersController < ApplicationController

  def index
    @users = User.all
    @position = Position.new
    @branch = Branch.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  private

    def user_params
      params[:user].permit(:login_id, :password, :name, :branch_id, :position_id)
    end

end
