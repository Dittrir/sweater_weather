class ForecastService
  def self.conn
    Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = ENV['open_weather_key']
    end
  end

  def self.get_forecast_for(latitude, longitude)
    response = conn.get("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}&exclude=minutely, alerts&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end
end
