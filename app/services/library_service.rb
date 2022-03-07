class LibraryService
  def self.conn
    Faraday.new(url: 'https://openlibrary.org')
  end

  def self.author_search(author)
    response = conn.get("/search/authors.json?q=#{author}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
