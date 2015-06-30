class PassengersController < ApplicationController
  def join
    Passenger.create!(user_id: session[:user_id],
      trip_id: params[:id]
    )
    @trip = Trip.where(id: params[:id]).first
    seats = @trip.seats - 1
    @trip.update_attributes(seats: seats)
    redirect_to trip_path(params[:id])
  end
end
