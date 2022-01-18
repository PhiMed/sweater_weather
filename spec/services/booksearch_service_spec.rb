require 'rails_helper'

RSpec.describe BooksearchService do
  describe 'class methods' do
    it 'get_forecast' do
      location = "Denver, CO"

      result = BooksearchService.search(location)
      expect(result).to be_a Hash
    end
  end
end
