class TripsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @trips = Trip.all
  end

  def new
    @user = User.find(session[:user_id])
    @trip = Trip.new
  end

  def create
    @user = User.find(session[:user_id])
  
    @trip = Trip.new(
      user_id: @user.id,
      origin: params[:trip][:origin],
      destination: params[:trip][:destination],
      price: params[:trip][:price],
      seats: params[:trip][:seats],
      car_photo: params[:trip][:car_photo],
      time: params[:trip][:time],
      date: params[:trip][:date] 
      )

    if @trip.save
      redirect_to trips_path
    end
  end
end

