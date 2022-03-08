require 'rails_helper'

RSpec.describe MapQuestService do
  describe "methods" do
    it '#get_lat_long_for', :vcr do
      location = 'Bellingham, WA'

      lat_long = MapQuestService.get_lat_long_for(location)

      expect(lat_long).to be_a(Hash)
    end

    it '#get_trip_details', :vcr do
      origin =  'Bellingham, WA'
      destination = 'Portland, OR'

      forecast = MapQuestService.get_trip_details(origin, destination)

      expect(forecast).to be_a(Hash)
    end
  end
end
