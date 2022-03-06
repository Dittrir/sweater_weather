class BackgroundService
  def self.conn
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = ENV['unsplash_key']
    end
  end

  def self.get_background_for(location)
    response = conn.get("/search/photos?query=#{location}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
