class BookFacade
  def self.search_for_book(location, quantity)
    forecast = weather_at(location)
    binding.pry
    book = BookService.search_for_book(location, quantity)

    Book.new(book)


  end

  def self.weather_at(destination)
    destination_forecast = ForecastFacade.get_forcast_for(destination)
       {
         :summary=> "#{destination_forecast.get_eta_forecast[0][:conditions]}",
         :temperature => "#{destination_forecast.get_eta_forecast[0][:temperature]} F"
       }
  end
end
