class ForecastFacade
  class << self
    def get_forecast(location)
      coordinates = GeocodingService.get_coordinates(location)
      data = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
      Forecast.new(data)
    end
  end
end
