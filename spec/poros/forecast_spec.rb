require 'rails_helper'

RSpec.describe Forecast, type: :model do
  describe Forecast do
    before(:each) do
      @forecast = Forecast.new(forecast_data)

      #forecast_data is in rails_helper
    end

    it 'exists' do
      expect(@forecast).to be_an_instance_of(Forecast)
    end

    it 'current_weather' do
      expect(@forecast.current_weather).to be_a Hash
      expect(@forecast.current_weather[:conditions]).to eq("clear sky")
    end

    it 'daily_weather' do
      expect(@forecast.daily_weather).to be_an Array
      expect(@forecast.daily_weather[0][:conditions]).to eq("snow")
    end

    it 'hourly_weather' do
      expect(@forecast.hourly_weather).to be_an Array
      expect(@forecast.hourly_weather[0][:conditions]).to eq("clear sky")
    end
  end
end
