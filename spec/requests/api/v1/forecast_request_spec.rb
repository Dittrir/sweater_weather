require 'rails_helper'

RSpec.describe 'The weather forcast API' do
  describe "returns a forecast for a specific location" do
    it 'happy path: current_weather' do
      location = "Bellingham, WA"

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)
      forecast_data = forecast[:data]

      expect(forecast_data).to have_key(:id)
      expect(forecast_data[:id]).to eq(nil)

      expect(forecast_data[:attributes]).to have_key(:current_weather)
      expect(forecast_data[:attributes][:current_weather]).to be_a(Hash)

      expect(forecast_data[:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast_data[:attributes][:current_weather][:datetime]).to be_a(String)

      expect(forecast_data[:attributes][:current_weather]).to have_key(:sunrise)
      expect(forecast_data[:attributes][:current_weather][:sunrise]).to be_a(String)

      expect(forecast_data[:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast_data[:attributes][:current_weather][:temperature]).to be_a(Float)

      expect(forecast_data[:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast_data[:attributes][:current_weather][:feels_like]).to be_a(Float)

      expect(forecast_data[:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast_data[:attributes][:current_weather][:humidity]).to be_a(Integer)

      expect(forecast_data[:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast_data[:attributes][:current_weather][:uvi]).to be_a(Float)

      expect(forecast_data[:attributes][:current_weather]).to have_key(:visibility)
      expect(forecast_data[:attributes][:current_weather][:visibility]).to be_a(Integer)

      expect(forecast_data[:attributes][:current_weather]).to have_key(:conditions)
      expect(forecast_data[:attributes][:current_weather][:conditions]).to be_a(String)

      expect(forecast_data[:attributes][:current_weather]).to have_key(:icon)
      expect(forecast_data[:attributes][:current_weather][:icon]).to be_a(String)
    end

    it 'happy path: daily_weather' do
      location = "Bellingham, WA"

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)
      forecast_data = forecast[:data]

      expect(forecast_data).to have_key(:id)
      expect(forecast_data[:id]).to eq(nil)

      expect(forecast_data[:attributes]).to have_key(:daily_weather)
      expect(forecast_data[:attributes][:daily_weather]).to be_a(Array)

      forecast_data[:attributes][:daily_weather].each do |day|
        expect(day).to have_key(:date)
        expect(day[:date]).to be_a(String)

        expect(day).to have_key(:sunrise)
        expect(day[:sunrise]).to be_a(String)

        expect(day).to have_key(:sunset)
        expect(day[:sunset]).to be_a(String)

        expect(day).to have_key(:max_temp)
        expect(day[:max_temp]).to be_a(Float)

        expect(day).to have_key(:min_temp)
        expect(day[:min_temp]).to be_a(Float)

        expect(day).to have_key(:conditions)
        expect(day[:conditions]).to be_a(String)

        expect(day).to have_key(:icon)
        expect(day[:icon]).to be_a(String)
      end
    end

    it 'happy path: hourly_weather' do
      location = "Bellingham, WA"

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)
      forecast_data = forecast[:data]

      expect(forecast_data).to have_key(:id)
      expect(forecast_data[:id]).to eq(nil)

      expect(forecast_data[:attributes]).to have_key(:hourly_weather)
      expect(forecast_data[:attributes][:hourly_weather]).to be_a(Array)

      forecast_data[:attributes][:hourly_weather].each do |day|
        expect(day).to have_key(:time)
        expect(day[:time]).to be_a(String)

        expect(day).to have_key(:temperature)
        expect(day[:temperature]).to be_a(Float)

        expect(day).to have_key(:conditions)
        expect(day[:conditions]).to be_a(String)

        expect(day).to have_key(:icon)
        expect(day[:icon]).to be_a(String)
      end
    end
  end
end
