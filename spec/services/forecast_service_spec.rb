require 'rails_helper'

RSpec.describe ForecastService do
  describe 'class methods' do
    it 'get_forecast' do
      lat = 39.757005
      lon = -105.224325

      result = ForecastService.get_forecast(lat, lon)
      expect(result).to be_a Hash
    end
  end
end
