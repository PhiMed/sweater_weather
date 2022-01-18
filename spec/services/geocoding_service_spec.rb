require 'rails_helper'

RSpec.describe GeocodingService do
  describe 'class methods' do
    it 'get_coordinates' do
      location = '911 10th Ave, Golden, CO 80401'

      result = GeocodingService.get_coordinates(location)

      expect(result).to be_a Hash
      expect(result[:lat]).to be > 39
      expect(result[:lat]).to be < 40
      expect(result[:lng]).to be < -105
      expect(result[:lng]).to be > -106 

    end
  end
end
