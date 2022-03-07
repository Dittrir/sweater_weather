class BookService
  def self.conn
    Faraday.new(url: 'https://openlibrary.org')
  end

  def self.search_for_book(location, quantity)
    response = conn.get("/search/authors.json?q=#{author}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
