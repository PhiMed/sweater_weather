require 'rails_helper'

describe Booksearch do
  before :each do
    @books = []

    book1 = Book.new({
                :isbn=>"43589403",
                :title=>"Travel Book",
                :publisher=>"Dewey, Cheatem & Howe LLC"
              })
    book2 = Book.new({
                :isbn=>"515151515151",
                :title=>"2nd Travel Book",
                :publisher=>"Dewey, Cheatem & Howe LLC"
              })
    book3 = Book.new({
                :isbn=>"9068687069",
                :title=>"3rd Travel Book",
                :publisher=>"Dewey, Cheatem & Howe LLC"
              })
    book4 = Book.new({
                :isbn=>"4954894309",
                :title=>"4th Travel Book",
                :publisher=>"Dewey, Cheatem & Howe LLC"
              })
    book5 = Book.new({
                :isbn=>"845485755",
                :title=>"5th Travel Book",
                :publisher=>"Dewey, Cheatem & Howe LLC"
              })

    @books << book1
    @books << book2
    @books << book3
    @books << book4
    @books << book5

    data = {
            :destination => "Denver, CO",
            :forecast => {
                        :summary => "Kinda just meh",
                        :temperature => 40
                      },
            :total_books_found => 150,
            :books => @books
             }
    @booksearch = Booksearch.new(data)
  end

  it 'exists' do
    expect(@booksearch).to be_an_instance_of(Booksearch)
  end

  it 'attributes' do
      expect(@booksearch.destination).to eq("Denver, CO")
      expect(@booksearch.forecast[:summary]).to eq("Kinda just meh")
      expect(@booksearch.forecast[:temperature]).to eq 40
      expect(@booksearch.total_books_found).to eq 150
      expect(@booksearch.books).to eq @books
  end
end
