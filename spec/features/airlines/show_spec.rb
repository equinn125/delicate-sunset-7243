require 'rails_helper'

RSpec.describe 'the airline show page' do
  before :each do
    @airline_1 = Airline.create!(name: 'Frontier')
    @flight_1 = @airline_1.flights.create!(number: '1727', date: "08/03/20", departure_city: "Denver", arrival_city: 'Reno')
    @flight_2 = @airline_1.flights.create!(number: '1728', date: "08/03/20", departure_city: "Denver", arrival_city: 'Phoenix')
    @passenger_1 = @flight_1.passengers.create!(name: 'Joe', age: 25)
    @passenger_2 = @flight_1.passengers.create!(name: 'Sally', age: 22)
    @passenger_3 = @flight_1.passengers.create!(name: 'Jill', age: 35)
    @passenger_4 = @flight_1.passengers.create!(name: 'Bill', age: 15)
  end
  it 'shows the list of passengers on the flight who are adults' do
    visit "/airlines/#{@airline_1.id}"
    expect(page).to have_content(@passenger_1.name)
    expect(page).to have_content(@passenger_2.name)
    expect(page).to have_content(@passenger_3.name)
    expect(page).to_not have_content(@passenger_4.name)
  end
end
