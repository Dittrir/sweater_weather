class MapQuestService
  def self.conn
    Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = ENV['open_weather_key']
    end
  end

  def get_forcast_for(latitude, longitude)
    response = conn.get("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}&exclude=minutely, alerts")
    JSON.parse(response.body, symbolize_names: true)
  end
end
