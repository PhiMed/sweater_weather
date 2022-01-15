require 'rails_helper'

RSpec.describe GeocodingService do
  describe 'class methods' do
    it 'get get_coordinates' do
      location = '911 10th Ave, Golden, CO 80401'

      result = GeocodingService.get_coordinates(location)

      expect(result.first).to have_key(:narrative)
    end
  end
end
