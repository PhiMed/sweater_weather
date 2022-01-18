class Forecast
  attr_reader  :id, :current_weather, :daily_weather, :hourly_weather


  def initialize(data)
    @id = nil
    @data = data
  end

  def current_weather
    {
      :datetime => Time.at(@data[:current][:dt]).to_datetime,
      :sunrise => Time.at(@data[:current][:sunrise]).to_datetime,
      :sunset => Time.at(@data[:current][:sunset]).to_datetime,
      :temperature => @data[:current][:temp],
      :feels_like => @data[:current][:feels_like],
      :humidity => @data[:current][:humidity],
      :uvi => @data[:current][:uvi],
      :visibility => @data[:current][:visibility],
      :conditions => @data[:current][:weather].first[:description],
      :icon => @data[:current][:weather].first[:icon]
    }
  end

  def daily_weather
    next_five_days = @data[:daily].shift(5)
    next_five_days.map do |day|
      {
        :date => Time.at(day[:dt]).to_datetime.strftime("%d/%m/%Y"),
        :sunrise => Time.at(day[:sunrise]).to_datetime,
        :sunset => Time.at(day[:sunset]).to_datetime,
        :max_temp => day[:temp][:max],
        :min_temp => day[:temp][:min],
        :conditions => day[:weather].first[:description],
        :icon => day[:weather].first[:icon]
      }
    end
  end

  def hourly_weather
    next_eight_hours = @data[:hourly].shift(8)
    next_eight_hours.map do |hour|
      {
        :time => Time.at(hour[:dt]).to_datetime.strftime("%I:%M %p"),
        :temperature => hour[:temp],
        :conditions => hour[:weather].first[:description],
        :icon => hour[:weather].first[:icon]
      }
    end
  end

  def roadtrip_hourly_weather
    @data[:hourly].map do |hour|
      {
        :temperature => hour[:temp],
        :conditions => hour[:weather].first[:description],
      }
    end
  end
end
