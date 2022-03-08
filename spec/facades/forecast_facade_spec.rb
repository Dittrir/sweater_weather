require 'rails_helper'

RSpec.describe ForecastFacade, type: :facade do
  context 'class methods' do
    it '#get_forcast_for', :vcr do
      location = "Bellingham, WA"

      forecast = ForecastFacade.get_forcast_for(location)

      expect(forecast).to be_a(Forecast)
    end
  end
end
