class GeocodingService
  class << self
    def conn
      conn = Faraday.new('http://www.mapquestapi.com')
    end

    def get_coordinates(location)
      api_key = ENV['mapquest_api_key']
      response = conn.get("/geocoding/v1/batch?key=#{api_key}&location=#{location}")
      JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
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
