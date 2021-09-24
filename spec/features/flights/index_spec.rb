require 'rails_helper'

RSpec.describe 'the flights index page' do
  before :each do
    @airline_1 = Airline.create!(name: 'Frontier')
    @airline_2 = Airline.create!(name: 'Delta')
    @flight_1 = @airline_1.flights.create!(number: '1727', date: "08/03/20", departure_city: "Denver", arrival_city: 'Reno')
    @flight_2 = @airline_2.flights.create!(number: '1728', date: "08/03/20", departure_city: "Denver", arrival_city: 'Phoenix')
    @passenger_1 = @flight_1.passengers.create!(name: 'Joe', age: 25)
    @passenger_2 = @flight_1.passengers.create!(name: 'Sally', age: 22)
    @passenger_3 = @flight_2.passengers.create!(name: 'Jill', age: 35)
    @passenger_4 = @flight_2.passengers.create!(name: 'Bill', age: 15)
  end

  it 'shows flight attributes including airline and passenger names' do
    visit "/flights"
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_2.number)

    within "#flight-#{@flight_1.id}" do
      expect(page).to have_content(@airline_1.name)
      expect(page).to have_content(@passenger_1.name)
      expect(page).to have_content(@passenger_2.name)
    end
    within "#flight-#{@flight_2.id}" do
      expect(page).to have_content(@airline_2.name)
      expect(page).to have_content(@passenger_3.name)
      expect(page).to have_content(@passenger_4.name)
    end
  end

  it 'has a button to remove a passenger' do
    visit "/flights"
    within "#flight-#{@flight_1.id}" do
      expect(page).to have_content(@passenger_1.name)
      expect(page).to have_content(@passenger_2.name)
      within("#passenger-#{@passenger_1.id}") do
        click_on "Remove Passenger"
        expect(current_path).to eq("/flights")
      end
      expect(page).to_not have_content(@passenger_1.name)
    end
  end
end
