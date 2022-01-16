require 'rails_helper'

RSpec.describe GeocodingService do
  describe 'class methods' do
    it 'get_coordinates' do
      location = '911 10th Ave, Golden, CO 80401'

      result = GeocodingService.get_coordinates(location)

      expect(result).to eq({:lat=>39.757005, :lng=>-105.224325})
    end
  end
end
