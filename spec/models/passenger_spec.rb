require 'rails_helper'

RSpec.describe Passenger do
  describe 'relationships' do
    it {should have_many :flight_passengers}
    it {should have_many(:flights).through(:flight_passengers)}
  end
  describe 'class methods' do
    it 'shows only the passengers on the specified airline' do
      airline_1 = Airline.create!(name: 'Frontier')
      airline_2 = Airline.create!(name: 'Delta')
      flight_1 = airline_1.flights.create!(number: '1727', date: "08/03/20", departure_city: "Denver", arrival_city: 'Reno')
      flight_2 = airline_2.flights.create!(number: '1728', date: "08/03/20", departure_city: "Denver", arrival_city: 'Phoenix')
      passenger_1 = flight_1.passengers.create!(name: 'Joe', age: 25)
      passenger_2 = flight_1.passengers.create!(name: 'Sally', age: 22)
      passenger_3 = flight_2.passengers.create!(name: 'Jill', age: 35)
      passenger_4 = flight_2.passengers.create!(name: 'Bill', age: 15)
      expect(Passenger.passengers_by_airline(airline_1.id)).to eq([passenger_1,passenger_2])
    end
    it 'shows all passengers over the age of 18' do
      airline_1 = Airline.create!(name: 'Frontier')
      flight_1 = airline_1.flights.create!(number: '1727', date: "08/03/20", departure_city: "Denver", arrival_city: 'Reno')
      flight_2 = airline_1.flights.create!(number: '1728', date: "08/03/20", departure_city: "Denver", arrival_city: 'Phoenix')
      passenger_1 = flight_1.passengers.create!(name: 'Joe', age: 25)
      passenger_2 = flight_1.passengers.create!(name: 'Sally', age: 22)
      passenger_3 = flight_2.passengers.create!(name: 'Jill', age: 35)
      passenger_4 = flight_2.passengers.create!(name: 'Bill', age: 15)
      expect(Passenger.all_adults).to eq([passenger_1,passenger_2,passenger_3])
    end
  end
end
