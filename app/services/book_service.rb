class BookService
  def self.conn
    Faraday.new(url: 'https://openlibrary.org')
  end

  def self.search_for_book(location)
    response = conn.get("/search.json?q=#{location}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
