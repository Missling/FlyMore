class UsersController < ApplicationController
  def show
    @user = User.where(id: session[:user_id]).first
  end
end
