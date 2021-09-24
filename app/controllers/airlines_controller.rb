class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @passengers = Passenger.passengers_by_airline(@airline.id).all_adults
  end
end
