class Route
  attr_reader :distance, :time

  def initialize(data)
    @distance = data[:distance]
    @time = data[:time]
  end

  def time_in_hours
    (@time.to_f / 3600).round(2)
  end

  def data_formatter(start_city, end_city, time_in_hours, weather_at_eta)
    if time_in_hours == 0.0
      travel_time = "impossible route"
    else
      minutes = (time_in_hours * 60).round(0) % 60
      hours = time_in_hours.round(0)
      travel_time = "#{hours} hours, #{minutes} minutes"
  end

  {
    :start_city => start_city,
    :end_city => end_city,
    :travel_time => travel_time,
    :weather_at_eta => weather_at_eta
  }
  end
end
