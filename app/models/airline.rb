class Airline < ApplicationRecord
  has_many :flights

  def adult_passenger_list
     flights.joins(:passengers)
    .select('passengers.*')
    .where('passengers.age > ?', 18)
    .distinct
    .pluck('passengers.name')
  end
end
