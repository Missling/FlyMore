class UsersController < ApplicationController

  def show
    @user = User.where(id: params[:id]).first
    @driver_ratings = Rating.where(user_id: params[:id], type: 1)
    @passenger_ratings = Rating.where(user_id: params[:id], type: 2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      password_hash: params[:user][:password_hash]
      )

      if params[:user][:password_hash] == params[:user][:password_confirmation]
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        @error = "Password confirmation must match Password"
        render :new
      end
  end
end
