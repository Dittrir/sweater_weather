class ForecastFacade
  def self.get_forcast_for(location)
    coords = MapQuestService.get_lat_long_for(location)
    forecast = ForecastService.get_forecast_for(coords[:lat], coords[:lng])

    Forecast.new(forecast)
  end
end
