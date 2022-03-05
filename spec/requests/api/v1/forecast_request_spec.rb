require 'rails_helper'

RSpec.describe 'The weather forcast API' do
  describe "returns a forecast for a specific location" do
    it 'happy path' do
      location = "Bellingham, WA"

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)
      forecast_data = forecast[:data]

      forecast_data.each do |forecast|
        expect(forecast).to have_key(:id)
        expect(forecast[:id].to_i).to be_an(Integer)

        expect(forecast[:attributes]).to have_key(:name)
        expect(forecast[:attributes][:name]).to be_a(String)

        expect(forecast[:attributes]).to have_key(:description)
        expect(forecast[:attributes][:description]).to be_a(String)

        expect(forecast[:attributes]).to have_key(:unit_price)
        expect(forecast[:attributes][:unit_price]).to be_a(Float)
      end
    end
  end
end
