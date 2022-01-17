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
        destination_coordinates = GeocodingService.get_coordinates(destination)
        weather_at_eta = self.get_forecast_in_x_hours(destination_coordinates, hours_to_destination)
          data =
            {
              :start_city => origin,
              :end_city => destination,
              :travel_time => formatted_time,
              :weather_at_eta => weather_at_eta
            }
      end
      Roadtrip.new(data)
    end

    def get_forecast_in_x_hours(destination_coordinates, hours_to_destination)
      a = ForecastService.get_forecast(destination_coordinates[:lat], destination_coordinates[:lng])
      if hours_to_destination < 1
        {
          :temperature => a[:hourly][0][:temp],
          :conditions => a[:hourly][0][:weather][0][:description]
        }
      elsif
        hours_to_destination > 48
        {
          :temperature => "Unavailable",
          :conditions => "Unavailable"
        }
      else
        {
          :temperature => a[:hourly][(hours_to_destination-1)][:temp],
          :conditions => a[:hourly][(hours_to_destination-1)][:weather][0][:description]
        }
      end
    end
  end
end
