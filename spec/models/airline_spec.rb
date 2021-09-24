require 'rails_helper'

RSpec.describe Airline do
  describe 'relationships' do
    it { should have_many(:flights) }
  end

  describe 'instance methods' do
    it 'shows all passengers for the airline who are an adult' do
      airline_1 = Airline.create!(name: 'Frontier')
      flight_1 = airline_1.flights.create!(number: '1727', date: "08/03/20", departure_city: "Denver", arrival_city: 'Reno')
      flight_2 = airline_1.flights.create!(number: '1728', date: "08/03/20", departure_city: "Denver", arrival_city: 'Phoenix')
      passenger_1 = flight_1.passengers.create!(name: 'Joe', age: 25)
      passenger_2 = flight_1.passengers.create!(name: 'Sally', age: 22)
      passenger_3 = flight_2.passengers.create!(name: 'Jill', age: 35)
      passenger_4 = flight_2.passengers.create!(name: 'Bill', age: 15)
      expect(airline_1.adult_passenger_list).to eq([passenger_1, passenger_2, passenger_3])
    end
  end
end
