class UsersController < ApplicationController
  def show
    @user = User.where(id: session[:user_id]).first
  end

  def new
    @user = User.new
  end

  def create
  p params
    @user = User.new(
      username: params[:user][:username],
      password: params[:user][:password]
      )

      if params[:user][:password] == params[:user][:password_confirmation]
        @user.save
        session[:user_id] = user.id
        redirect_to user_path
      else
        @error = "Password confirmation must match Password"
        render :new
      end
  end
end
