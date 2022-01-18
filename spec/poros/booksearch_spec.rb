require 'rails_helper'

describe Booksearch do
  before :each do
    @books = []

    book1 = create(:book)
    book2 = create(:book)
    book3 = create(:book)
    book4 = create(:book)
    book5 = create(:book)
    book6 = create(:book)

    @books << book1
    @books << book2
    @books << book3
    @books << book4
    @books << book5

    data = {
            :destination => "Denver, CO ",
            :forecast => {
                        :summary => "Kinda just meh",
                        :temperature => 40
                      },
            :total_books_found => 5,
            :books => @books
             }
    @booksearch = Booksearch.new(data)
  end

  it 'exists' do
    expect(@booksearch).to be_an_instance_of(Booksearch)
  end

  it 'attributes' do
      expect(@booksearch.destination).to eq("Los Angeles, CA")
      expect(@booksearch.forecast[:summary]).to eq("Kinda just meh")
      expect(@booksearch.forecast[:temperature]).to eq 40
      expect(@booksearch.total_books_found).to eq 5
      expect(@booksearch.books).to eq @books
  end
end