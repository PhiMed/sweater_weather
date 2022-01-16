require 'rails_helper'

RSpec.describe 'forecast' do
    it 'returns a forecast' do
      location1 = '5598 W 72nd Pl, Arvada, CO 80003'
      location2 = '11002 Benton St, Westminster, CO 80020'

      result = MapService.farm_directions(location1, location2)

      expect(result.first).to have_key(:narrative)
    end
end
