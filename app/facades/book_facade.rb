class BookFacade
  def self.search_for_book(location, quantity)
    forecast = weather_at(location)
    json = BookService.search_for_book(location)
    total_books_found = json[:numFound]
    books = json[:docs].first(quantity.to_i).map do |book|
      Book.new(book)
    end

    data = {
              :destination => location,
              :forecast => forecast,
              :total_books_found => total_books_found,
              :books => books
            }

    BookSearch.new(data)
  end

  def self.weather_at(location)
    destination_forecast = ForecastFacade.get_forcast_for(location)
       {
         :summary=> "#{destination_forecast.get_eta_forecast[0][:conditions]}",
         :temperature => "#{destination_forecast.get_eta_forecast[0][:temperature]} F"
       }
  end
end
