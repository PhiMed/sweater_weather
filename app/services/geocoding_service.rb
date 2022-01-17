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

    def get_travel_time(origin, destination)
      api_key = ENV['mapquest_api_key']
      response = conn.get("/directions/v2/route?key=#{api_key}&from=#{origin}&to=#{destination}")
      a = JSON.parse(response.body, symbolize_names: true)[:route][:formattedTime]
      b = JSON.parse(response.body, symbolize_names: true)[:route][:realTime]
      c = {:formatted_time => a, :travel_time_in_seconds => b}
      c

    end
  end
end
