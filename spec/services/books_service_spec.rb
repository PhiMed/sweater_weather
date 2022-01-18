require 'rails_helper'

RSpec.describe BooksService do
  describe 'class methods' do
    it 'get_forecast' do
      location = "Denver, CO"

      result = BooksService.search(location)
      expect(result).to be_a Hash
    end
  end
end
