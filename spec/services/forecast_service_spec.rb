require 'rails_helper'

RSpec.describe ForecastService do
  describe "methods" do
    it '#get_forecast_for', :vcr do
      lat = 48.754899
      long = -122.478122

      forecast = ForecastService.get_forecast_for(lat, long)

      expect(forecast).to be_a(Hash)
    end
  end
end
