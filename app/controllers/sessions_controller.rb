class SessionsController < ApplicationController

  def new
    render 'login'
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:id)
    current_user = nil
    redirect_to root_path
  end

end
