class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user && @user.save
      session[:id] = @user.id
      redirect_to @user
      # redirect to 'login'
    else
      render 'new'
    end
  end

  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order("created_at DESC")
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
