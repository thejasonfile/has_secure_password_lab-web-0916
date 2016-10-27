class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.password = params[:user][:password]
      session[:user_id] = User.last.id
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def show
    
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end

end