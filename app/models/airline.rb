class Airline < ApplicationRecord
  has_many :flights

  def adult_passenger_list
    wip = flights.joins(:passengers)
    binding.pry
  end
end
