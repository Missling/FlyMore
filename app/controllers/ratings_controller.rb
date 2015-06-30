class RatingsController < ApplicationController
  def create
    @rating = Rating.new(
      value: params[:rating][:value],
      user_type: params[:rating][:user_type],
      comment: params[:rating][:comment],
      user_id: params[:user_id]
    )
    if @rating.save
      redirect_to user_path(@rating.user)
    end
  end

end
