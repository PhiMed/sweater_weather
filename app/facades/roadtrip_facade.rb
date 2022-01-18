class RoadtripFacade
  class << self
    def aggregate(origin, destination)
      travel_time = GeocodingService.get_travel_time(origin, destination)
      formatted_time = travel_time[:formatted_time]
      travel_time_in_seconds = travel_time[:travel_time_in_seconds]
      if travel_time_in_seconds.nil?
        data =
          {
            :start_city => origin,
            :end_city => destination,
            :travel_time => "Impossible",
            :weather_at_eta => ""
          }
      else
        hours_to_destination = (travel_time_in_seconds / 3600).round(0)
          data =
            {
              :start_city => origin,
              :end_city => destination,
              :travel_time => formatted_time,
              :weather_at_eta => forecast_on_arrival(destination, hours_to_destination)
            }
      end
      Roadtrip.new(data)
    end

    def forecast_on_arrival(destination, hours_to_destination)
      forecast = ForecastFacade.get_forecast(destination)
      if hours_to_destination < 1
        {
          :temperature => forecast.roadtrip_hourly_weather[0][:temperature],
          :conditions => forecast.roadtrip_hourly_weather[0][:conditions]
        }
      elsif
        hours_to_destination > 48
        {
          :temperature => "Unavailable",
          :conditions => "Unavailable"
        }
      else
        {
          :temperature => forecast.roadtrip_hourly_weather[(hours_to_destination-1)][:temperature],
          :conditions => forecast.roadtrip_hourly_weather[(hours_to_destination-1)][:conditions]
        }
      end
    end
  end
end
