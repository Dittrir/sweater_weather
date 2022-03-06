class RoadTripFacade
  def self.new_trip(origin, destination)
    trip_details = MapQuestService.get_trip_details(origin, destination)
    route = Route.new(trip_details[:route])
binding.pry
    Forecast.new(data)
  end
end
