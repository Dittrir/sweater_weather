class RoadTripFacade
  def self.new_trip(start_city, end_city)
    trip_details = MapQuestService.get_trip_details(start_city, end_city)
    route = Route.new(trip_details[:route])
    weather_at_eta = weather_at_eta(end_city, route.time_in_hours)
    data = route.data_formatter(start_city, end_city, route.time_in_hours, weather_at_eta)

    RoadTrip.new(data)
  end

  def self.weather_at_eta(destination, eta_in_hours)
    destination_forecast = ForecastFacade.get_forcast_for(destination)
    if eta_in_hours == nil || eta_in_hours > 48
      {
        :temperature => "N/A",
        :conditions => "N/A"
      }
    else
     {
       :temperature => destination_forecast.get_eta_forecast[(eta_in_hours - 1).round(0)][:temperature],
       :conditions => destination_forecast.get_eta_forecast[(eta_in_hours - 1).round(0)][:conditions]
     }
   end
  end
end
