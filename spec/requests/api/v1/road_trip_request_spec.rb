require 'rails_helper'

RSpec.describe 'The road trip API' do
  describe "can start a new road trip" do
    it 'happy path', :vcr do
      new_road_trip = {
                        "origin": "Denver,CO",
                        "destination": "Pueblo,CO",
                        "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post "/api/v1/road_trip", params: new_road_trip, as: :json

      expect(response).to be_successful

      new_road_trip = JSON.parse(response.body, symbolize_names: true)
      new_road_trip_data = new_road_trip[:data]

      expect(new_road_trip_data).to have_key(:id)
      expect(new_road_trip_data[:id]).to eq(nil)

      expect(new_road_trip_data[:attributes]).to have_key(:start_city)
      expect(new_road_trip_data[:attributes][:start_city]).to be_a(String)

      expect(new_road_trip_data[:attributes]).to have_key(:end_city)
      expect(new_road_trip_data[:attributes][:end_city]).to be_a(String)

      expect(new_road_trip_data[:attributes]).to have_key(:travel_time)
      expect(new_road_trip_data[:attributes][:travel_time]).to be_a(String)

      expect(new_road_trip_data[:attributes]).to have_key(:weather_at_eta)
      expect(new_road_trip_data[:attributes][:weather_at_eta]).to be_a(Hash)

      expect(new_road_trip_data[:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(new_road_trip_data[:attributes][:weather_at_eta][:temperature]).to be_a(Float)

      expect(new_road_trip_data[:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(new_road_trip_data[:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it 'sad path: insufficient params', :vcr do
      new_road_trip = {
                        "destination": "Pueblo,CO",
                        "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post "/api/v1/road_trip", params: new_road_trip, as: :json

      return_value = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      expect(return_value[:error]).to eq("Origin and Destination are Required.")
    end

    it 'edge case: eta exceeds forecasted conditions', :vcr do
      new_road_trip = {
                        "origin": "Juneau,AK",
                        "destination": "Miami,FL",
                        "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post "/api/v1/road_trip", params: new_road_trip, as: :json

      return_value = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)

      expected = {:temperature=>"N/A", :conditions=>"N/A"}

      expect(return_value[:data][:attributes][:weather_at_eta]).to eq(expected)
    end

    it 'edge case: impossible trip', :vcr do
      new_road_trip = {
                        "origin": "Juneau,AK",
                        "destination": "Berlin, Germany",
                        "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post "/api/v1/road_trip", params: new_road_trip, as: :json

      return_value = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(return_value[:data][:attributes][:travel_time]).to eq("impossible route")
    end
  end
end
