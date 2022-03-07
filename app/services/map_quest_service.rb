class MapQuestService
  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params["key"] = ENV['map_quest_key']
    end
  end

  def self.get_lat_long_for(location)
    response = conn.get("/geocoding/v1/address?location=#{location}")

    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.get_trip_details(origin, destination)
    response = conn.get("/directions/v2/route?from=#{origin}&to=#{destination}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
