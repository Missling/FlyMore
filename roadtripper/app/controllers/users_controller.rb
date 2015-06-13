class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def login  
    @user = User.where(username: params[:user][:username]).first
    p @user
    if @user && @user.password_hash == params[:user][:password_hash]
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.where(id: session[:user_id]).first
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

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_url
  end
end
