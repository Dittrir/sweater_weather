class ForecastFacade
  def self.get_forcast_for(location)
    coords = MapQuestService.get_lat_long_for(location)
    forecast = ForecastService.get_forcast_for(coords[:lat], coords[:long])

    Forecast.new(forecast)
  end
end
