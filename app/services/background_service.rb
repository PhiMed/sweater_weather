class BackgroundService
  class << self
    def conn
      conn = Faraday.new(url: 'https://api.unsplash.com')
    end

    def get_background(location)
      api_key = ENV['unsplash_access_key']
      response = conn.get("/search/photos?query=#{location}&client_id=#{api_key}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
