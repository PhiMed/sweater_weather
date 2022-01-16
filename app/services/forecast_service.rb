class ForecastService
  class << self
    def conn
      conn = Faraday.new(url: 'https://api.openweathermap.org')
    end

    def get_forecast(lat, lon)
      api_key = ENV['openweathermap_api_key']
      response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&appid=#{api_key}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
