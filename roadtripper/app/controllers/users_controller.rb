class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def update
    @user = User.where(id: params[:id]).first
    @user.update_attributes(
      profile_picture: params[:user][:profile_picture],
      introduction: params[:user][:introduction],
      contact_info: params[:user][:contact_info]
    )
      redirect_to user_path(@user.id)
  end

  def login
    @user = User.where(username: params[:user][:username]).first
    if @user && @user.password_hash == params[:user][:password_hash]
      # @current_user = @user
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      @error = "Invalid Username or Password"
      render :index
    end
  end

  def show
    @user = User.where(id: session[:user_id]).first
    @user = User.where(id: params[:id]).first
    @driver_ratings = Rating.where(user_id: params[:id], user_type: 1)
    @passenger_ratings = Rating.where(user_id: params[:id], user_type: 2)
    @rating = Rating.new
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
        # @current_user = @user
        redirect_to user_path(@user.id)
      else
        @error = "Password confirmation must match Password"
        render :new
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
