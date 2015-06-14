class TripsController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    @trip = Trip.new
  end

  def create
    p params
    p @user
    @trip = Trip.new(
      origin: params[:trip][:origin],
      destination: params[:trip][:destination],
      price: params[:trip][:price],
      seats: params[:trip][:seats],
      car_photo: params[:trip][:car_photo],
      time: params[:trip][:time],
      date: params[:trip][:date] 
      )

    if @trip.save
      redirect_to user_path(@user.id)
    end
  end
end

