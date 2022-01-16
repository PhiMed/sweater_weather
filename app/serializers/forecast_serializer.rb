class ForecastSerializer
  include JSONAPI::Serializer
  attributes :id
  attributes :current_weather
  attributes :daily_weather
  attributes :hourly_weather
end
