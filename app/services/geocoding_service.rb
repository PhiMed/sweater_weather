class GeocodingService
  class << self
    def conn
      conn = Faraday.new(url: ENV['geocoding_api_path'])
    end

    def get_coordinates(location)
      response = conn.get("/geocoding/v1/batch?api_key=#{ENV['mapquest_api_key']}&location=#{location}")
      a = JSON.parse(response.body, symbolize_names: true)
    end

    def post_data(url)
      response = conn.post(url)

      JSON.parse(response.body, symbolize_names: true)
    end

    def patch_data(url)
      response = conn.patch(url)

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
