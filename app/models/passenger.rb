class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers

  def self.passengers_by_airline(airline_id)
    joins(:flights).where('flights.airline_id': airline_id).distinct
  end

  def self.all_adults
    where('age >?', 18)
  end
end
