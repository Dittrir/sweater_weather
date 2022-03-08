require 'rails_helper'

RSpec.describe RoadTripFacade, type: :facade do
  context 'class methods' do
    it '#new_trip', :vcr do
      start_city = "Bellingham, WA"
      end_city = "Portland, OR"

      road_trip = RoadTripFacade.new_trip(start_city, end_city)

      expect(road_trip).to be_a(RoadTrip)
    end

    it '#weather_at_eta', :vcr do
      destination = "Portland, OR"
      eta_in_hours = 6

      road_trip = RoadTripFacade.weather_at_eta(destination, eta_in_hours)

      expect(road_trip).to be_a(Hash)
    end
  end
end
