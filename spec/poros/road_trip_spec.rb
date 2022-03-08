require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists' do
      attributes = {
                      :start_city=>"Bellingham, WA",
                      :end_city=>"Portland, OR",
                      :travel_time=>"4 hours, 14 minutes",
                      :weather_at_eta=>{:temperature=>44.11, :conditions=>"light rain"}
                    }

      road_trip = RoadTrip.new(attributes)

      expected = {:temperature=>44.11, :conditions=>"light rain"}

      expect(road_trip).to be_an_instance_of(RoadTrip)
      expect(road_trip.id).to eq(nil)
      expect(road_trip.start_city).to eq("Bellingham, WA")
      expect(road_trip.end_city).to eq("Portland, OR")
      expect(road_trip.travel_time).to eq("4 hours, 14 minutes")
      expect(road_trip.weather_at_eta).to eq(expected)
  end
end
