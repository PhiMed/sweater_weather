require 'rails_helper'

RSpec.describe BooksService do
  describe 'class methods' do
    it 'search' do
      location = "Denver, CO"

      result = BooksService.search(location)
      expect(result).to be_a Hash
      expect(result).to have_key(:numFound)
      expect(result[:numFound]).to be_an Integer
      expect(result).to have_key(:docs)
      expect(result[:docs]).to be_an Array
      expect(result[:docs][0]).to have_key(:title)

    end
  end
end
