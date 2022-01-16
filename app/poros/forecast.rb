class Forecast
  attr_reader  :id, :current_weather, :daily_weather, :hourly_weather


  def initialize(data)
    @id = nil
    @data = data
  end

  def current_weather
    {
      :datetime => @data[:current][:dt],
      :sunrise => @data[:current][:sunrise],
      :sunset => @data[:current][:sunset],
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
        :date => day[:dt],
        :sunrise => day[:sunrise],
        :sunset => day[:sunset],
        :max_temp => day[:temp][:max],
        :min_temp => day[:temp][:min],
        :conditions => day[:weather].first[:description],
        :icon => day[:weather].first[:icon]
      }
    end
  end

  def hourly_weather

  end
end
